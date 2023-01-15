import Fluent
import Vapor

func routes(_ app: Application) throws {
    app.get(use: welcome)
    try app.register(collection: TodoController())
}

func welcome(_ req: Request) -> String {
    return "Welcome to the iOS Apprenticeship Backend!!"
}
