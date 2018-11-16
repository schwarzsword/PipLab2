package servlets;

import java.util.logging.Filter;
import java.util.logging.LogRecord;

public class Test implements Filter {
    public boolean isLoggable(LogRecord record) {
        return false;
    }

}
