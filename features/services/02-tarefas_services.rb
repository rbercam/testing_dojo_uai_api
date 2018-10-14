class Tarefa 
    include HTTParty
    base_uri CONFIG['base_uri']

    def initialize (body, token)
        @options = {:headers => {
            "Content-Type" => "application/json",
            "Accept" => "application/vnd.taskmanager.v2",
            "Authorization" => token
        }, :body => body
    }
    end

    def post_task
        self.class.post("/tasks",@options)
    end

    def get_task(id)
        self.class.get("/tasks/#{id}",@options)
    end









    
    def get_all_task
        self.class.get("/tasks",@options)
    end

    def put_task(body)
        self.class.put("/tasks", @options)
    end

    def delete_task(token)
        self.class.delete("/tasks/#{token}", @options)
    end
end