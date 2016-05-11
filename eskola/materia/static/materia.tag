<materia>
    <h1>Hello World!</h1>
    <ul>
        <li each= { materia_list }>
           <div> { name } </div>
           <div> { description } </div>
           <button onclick={ delete }>Delete</button>
        </li>
    </ul>

    <form onsubmit={ add }>
        Name: <input type="text" name="input"><br/>
        Description : <textarea name="text"></textarea><br/>
        <button>Add</button>
    </form>

    <div>

    </div>


    var self = this
    self.materia_list = []

    this.on('mount', function(){
        // get our materia_list
        $.get('/api/materia_list/', function(data){
            self.materia_list = data.results
            self.update()
        })

    })

    add(e){
        if( self.input.value ){
            var new_materia = {
                name : self.input.value,
                description : self.text.value
            }
            $.post('/api/materia_list/', new_materia, function(data){
                self.materia_list.push(data)
                self.update()
                self.input.value = ''
                self.text.value = ''
            })
        }
    }

    delete(e){
        //delete the materia
        $.ajax(e.item.url, {
            method: 'DELETE',
            success:  function(data){
                // delete materia from local array
                var items_position = self.materia_list.indexOf(e.item)
                self.materia_list.splice(items_position, 1)
                self.update()
            }
        })
    }

</materia>
