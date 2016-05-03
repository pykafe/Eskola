<materia>
    <h1>Hello World!</h1>
    <ul>
        <li each= {materias}>
            <div> { name } </div>
            <div> { description } </div>
            <button onclick={ delete }>X</button>
        </li>
    </ul>
    
    <form onsubmit={ add }>
        Name: <input type="text" name="input"><br/>
        Description : <textarea name="text"></textarea><br/>
        <button>Add</button>
    </form>


    var self = this                                                                                                                 
    self.materias = []

    this.on('mount', function(){
        // get our materia_list
        $.get('/api/materias/', function(data){
            self.materias = data.results            
            self.update()
        })

    }) 

    add(e){
        if( self.input.value ){
            var new_materia = { 
                name : self.input.value,
                description : self.text.value 
            }
            $.post('/api/materias/', new_materia, function(data){
                self.materias.push(data)
                self.update()
                self.input.value = ''
                self.text.value = ''
            })
        }
    }

    delete(e){
                // delete the todo
                $.ajax(e.item.url, {
                    method: 'DELETE',
                    success: function(data){
                        alert('deleted')
                    var position_of_item = self.materias.indexOf(e.item)
                    self.materias.splice(position_of_item, 1)
                    self.update()
                    }
                })
            }
</materia>
