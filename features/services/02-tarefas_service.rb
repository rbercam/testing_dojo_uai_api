class Tarefa 
    include HTTParty
    base_uri CONFIG['base_uri']

    def initialize (headers, body)
        @options = {:headers => headers, :body => body}
    end

    def post_task(token, body)
        @opt = {
            :headers => {
                "Content-Type" => "application/json",
                "Accept" => "application/vnd.taskmanager.v2",
                "Authorization" => token
            },
            :body => body
        }
        self.class.post("/tasks",@opt)
    end

    def get_all_task(token)
            @opt = {
                :headers => {
                "Content-Type" => "application/json",
                "Accept" => "application/vnd.taskmanager.v2",
                "Authorization" => token
                }
            }
            self.class.get("/tasks",@opt)
    end

    def get_task(token, id)
        @opt = {
            :headers => {
            "Content-Type" => "application/json",
            "Accept" => "application/vnd.taskmanager.v2",
            "Authorization" => token
            }
        }
        self.class.get("/tasks/#{id}",@opt)
    end

    def put_task(token, body)
        @opt = {
            :headers => {
                "Content-Type" => "application/json",
                "Accept" => "application/vnd.taskmanager.v2",
                "Authorization" => token
            },
            :body => body
        }
        self.class.put("/tasks", @opt)
    end

    def delete_task(token)
        @opt = {
            :headers => {
            "Content-Type" => "application/json",
            "Accept" => "application/vnd.taskmanager.v2",
            "Authorization" => token
            }
        }
        self.class.delete("/tasks", @opt)
    end
end