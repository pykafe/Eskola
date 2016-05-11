<materia>
    <h1>Hello World!</h1>
    <ul>
        <li each= { materia_list }>
            <div> { name } </div>
            <div> { description } </div>
            <button onclick={ delete }>Delete</button>
            <button onclick={ edit }>Edit</button>
        </li>
    </ul>

    <form if={ item_add } onsubmit={ add }>
        Name: <input type="text" name="input"><br/>
        Description : <textarea name="text"></textarea><br/>
        <button>Add</button>
    </form>

    <div if={ item_edit }>
        Name: <input name="edit_input" /></br>
        Description: <textarea name="edit_text"></textarea><br/>
        <button onclick={ submit }>Submit</button>
        <button onclick={ cancel } >Cancel</button>
    </div>


    <script>
        var self = this
        self.item_add = true
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

        edit(e){
            self.item_add = false
            self.item_edit = e.item
            self.edit_input.value = e.item.name
            self.edit_text.value = e.item.description
        }

        cancel(e){
            self.item_edit = false
            self.item_add = true
            }

        submit(e){
            self.item_edit.name = self.edit_input.value
            self.item_edit.description = self.edit_text.value
            $.ajax(self.item_edit.url, {
                method: 'PUT',
                data: self.item_edit,
                success: function(data){
                    self.item_edit = false
                    self.item_add = true
                    self.update()
                }
            })
        }
    </script>

</materia>
