json.extract! task, :id, :taskname, :taskimgurl, :taskamt, :taskval, :created_at, :updated_at
json.url task_url(task, format: :json)
