// Playground - noun: a place where people can play
// a calculator of tip

// Define the class Tipcalculator, start class name with Capital letter
class Tipcalculator  {
    
    // create 3 constant properties, properties declared must be set values here or in initializer
    // these 3 properties can be accessed throughout the class
    let total:Double
    let taxPct:Double
    let subtotal:Double
    
    // create initializer with 2 parmaters
    init(total:Double, taxPct:Double){
        
        // the properties names are the same with paramters names, so we add self. to distinguish
        // the initializer property total take the value from parameter total
        self.total = total
        
        // the properties names are the same with paramters names, so we add self. to distinguish
        // the initializer property taxPct take the value from parameter taxPct
        self.taxPct = taxPct
        
        //subtotal property name is not also a paramter name, so we don't need self. added
        // the property subtotal is a divide operation result of two other properties
        subtotal = total/(taxPct+1)
        
    }
    
    // create method named calcTipwithTipPct using func 
    // it takes 1 parameter type Double, and return type Double using -> symbol
    func calcTipwithTipPct(tipPct:Double) -> Double {
        
        return subtotal*tipPct
    }
    
    // create method to return result in a dictionary,which is a struct in swift
    // [Int:Double] is short for dictionary<Int:Double>
    func returnPossibleTips() -> [Int: Double] {
        
        // create a constant array of 3 elements
        let possibleTips = [0.15,0.18,0.20]
        
        // create the result as a var here
        var result = [Int:Double]()
        
        // possibletip is the iterating element in the array possibleTips
        for possibletip in possibleTips {
            
            // cast into a int type
            let intPct = Int(possibletip*100)
            
            // for each int in result, calculate the tip
            result[intPct] = calcTipwithTipPct(possibletip)
        
        }
        
        return result

    }
}

// create an object tipCal from the class Tipcalculator
let tipCal = Tipcalculator(total: 33.25, taxPct: 0.10)

// call the method of return tipcalculation result
tipCal.returnPossibleTips()

