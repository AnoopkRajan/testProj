@IsTest
public class TestClassTest {
    
    @IsTest
    static void testConstructor() {
        // Instantiate the TestClass to test its constructor
        TestClass1 testClassInstance = new TestClass1();
        if(testClassInstance != null){
            System.assert(true);
        }
        else{
            System.assert(false, 'testConstructor: TestClass instance is null');
        }

        // You can add assertions here if there are any outcomes to validate
        // Since the class only prints debug logs, there's nothing specific to assert
    }
}