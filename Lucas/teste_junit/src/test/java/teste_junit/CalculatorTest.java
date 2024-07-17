package teste_junit;

import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.assertEquals;
import static org.junit.jupiter.api.Assertions.assertThrows;

class CalculatorTest {
    double a;
    double b;
    double res;
    Calculator calculator;

    @BeforeEach
    void setUp() {
        calculator = new Calculator();
        a = 5;
        b = 2;
        res = 0;
        System.out.println("Antes de Cada Teste");
    }

    @Test
    void testAdd() {
        res = calculator.add(a, b);
        assertEquals(7, res);
    }

    @Test
    void subtract() {
        res = calculator.subtract(a, b);
        assertEquals(3, res);

    }

    @Test
    void multiply() {
        res = calculator.multiply(a, b);
        assertEquals(10, res);
    }

    @Test
    void divide() {
        res = calculator.divide(a, b);
        assertEquals(2.5, res);
    }
}