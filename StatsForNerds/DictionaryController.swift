import UIKit

/*
 This class handles the set of editable words
 
 */
class DictionaryController: UITableViewController,NewDefinitionDelegate,
                   ChangeDefinitionDelegate {

    var words: [Word] = []
    var savedlocation = 0
    /*
      Loads class and load definition to be presented
    */
    override func viewDidLoad(){
        super.viewDidLoad();
        
        loadDefinitions()
        print("Documents folder is \(documentsDirectory())")
        print("Data file path is \(dataFilePath())")
    }
    override func didReceiveMemoryWarning(){
        super.didReceiveMemoryWarning();
        
    }
    
    @IBAction func close(){
        dismiss(animated:true ,completion:nil);
    }
    
    /* 
     This method sets up the table rows 
      returns cell for the respective row
     
    */
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "wordListItem", for: indexPath)
        
        let label = cell.viewWithTag(2000) as! UILabel
        let number = indexPath.row
        if( number>=0 && number < words.count){
            label.text = words[number].name
        }
        return cell
        
    }
    /*
     return number of rows
    */
    override func tableView(_ tableView: UITableView,
                            numberOfRowsInSection section: Int) -> Int {
        return  words.count
    }
    /*
        handles clicking on the rows. Take user to another screen
 
    */
    override func tableView(_ tableView: UITableView,
                            didSelectRowAt indexPath: IndexPath) {
        let question = words[indexPath.row]
        savedlocation = indexPath.row
        performSegue(withIdentifier: "displaydictionary", sender: question)
        
    }
    /*
        Method passes a object to another view controller
 
     */
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if(segue.identifier == "displaydictionary"){
            let destination = segue.destination as! DefinitionController
            destination.word = sender as! Word
            destination.delegate = self
        }
        
        if (segue.identifier == "addNewDefinition"){
            let destination  = segue.destination as! NewDefinitionViewController
            destination.delegate = self;
        }
    }
    /*
        Handles changing word after the editing screen.
 
     */
    func changeDefinition(word: Word) {
 
        words[savedlocation].name = word.name
        words[savedlocation].meaning = word.meaning
        let indexpath = IndexPath(row:savedlocation, section:0)
        let cell = tableView.cellForRow(at:indexpath)
        let label  = cell?.viewWithTag(2000) as! UILabel
        label.text = word.name
        dismiss(animated: true, completion: nil)
        saveDefinitions()

    }
    /*
        handles adding a new word from the plus widget
 
     */
    func addNewDefinition(word: Word) {
        
        let newRowIndex = words.count
        words.append(word)
        
        let indexPath = IndexPath(row: newRowIndex, section: 0)
        let indexPaths = [indexPath]
        tableView.insertRows(at: indexPaths, with: .automatic)
        dismiss(animated: true, completion: nil)
        saveDefinitions();
        
    }
    /*
        saves current array of words to a file
     
    */
    func saveDefinitions() {
        let data = NSMutableData()
        let archiver = NSKeyedArchiver(forWritingWith: data)
        archiver.encode(words, forKey: "Definitions")
        archiver.finishEncoding()
        data.write(to: dataFilePath(), atomically: true)
    }
    /* 
        loads array of words from a file
 
    */
    func loadDefinitions() {
        let path = dataFilePath()
        if let data = try? Data(contentsOf: path) {
            let unarchiver = NSKeyedUnarchiver(forReadingWith: data)
            words = unarchiver.decodeObject(forKey: "Definitions") as! [Word]
            unarchiver.finishDecoding()
        }
    }
    /*
        tells location for storage
     
     */
    func dataFilePath() -> URL {
        return documentsDirectory().appendingPathComponent("Definitions.plist")
    }
    func documentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
    /*
        handles swipe for deleting rows
     */
    override func tableView(_ tableView: UITableView,
                            commit editingStyle: UITableViewCellEditingStyle,
                            forRowAt indexPath: IndexPath) {
        words.remove(at: indexPath.row)
        let indexPaths = [indexPath]
        tableView.deleteRows(at: indexPaths, with: .automatic)
        saveDefinitions()
    }
    
    //Disclaimer: some of the methods here are taken from CheckList App provided by Angus Yeung
    
    
    
}






