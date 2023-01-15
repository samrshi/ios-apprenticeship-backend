import Fluent
import Vapor

struct TodoController: RouteCollection {
    func boot(routes: RoutesBuilder) throws {
        routes.get("todos", use: fetchTodos)
        routes.post("todo", use: addTodo)
    }
}

func fetchTodos(_ req: Request) async throws -> [Todo] {
    let todos = try await Todo.query(on: req.db).all()
    return todos
}

func addTodo(_ req: Request) async throws -> Todo {
    let todo = try req.content.decode(Todo.self)
    try await todo.save(on: req.db)
    return todo
}
