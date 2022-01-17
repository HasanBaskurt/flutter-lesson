// Interface usage
void main() {
  CustomerManager customerManager = CustomerManager();
  customerManager.save(DatabaseLogger());
}

class ICustomerManager {
  void save(ILogger logger) {}
}

class CustomerManager implements ICustomerManager {
  @override
  void save(ILogger logger) {
    logger.log("Logged to ");
  }
}

class ILogger {
  void log(String message) {}
}

class DatabaseLogger implements ILogger {
  @override
  void log(String message) {
    print(message + "Database");
  }
}

class FileLogger implements ILogger {
  @override
  void log(String message) {
    print(message + "File");
  }
}
