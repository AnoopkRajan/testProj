@IsTest
public class FirstClassTest {

    @IsTest
    static void testConstructor() {
        // Instantiate the TestClass to test its constructor
        FirstClass testClassInstance = new FirstClass();

        if(testClassInstance != null){
            System.assert(true, 'testConstructor: TestClass instance is not null');
        }
        else{
            System.assert(false, 'testConstructor: TestClass instance is null');
        }

        // You can add assertions here if there are any outcomes to validate
        // Since the class only prints debug logs, there's nothing specific to assert
    }
        
}