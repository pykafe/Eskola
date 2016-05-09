<materia>
    
    <h2>Hello World!</h2>
    
    <form onsubmit={ add }>
        Name:
        <input name="input_name">
        Description:
        <textarea name="input_description"></textarea>
        <button onclick={ add }> Add</button>
    </form>

    <div if={ editing_item }>
        Name:
        <input name="edit_name">
        Description:
        <textarea name="edit_description"></textarea>
        <button onclick={ edit_save }>Save</button>
        <button onclick={ stop_edit } >Back</button>
    </div>

    <ol> 
        <li each={ materias }>
            Name :{ name } <br>
            Description :
            { description }
            <button onclick={ edit } >Edit</button>
            <button onclick={ delete } >DELETE</button>
        </li>
    </ol>
                
    var self = this
    self.adding_item = true
    self.materias = []
    console.log(self)

    self.one('mount', function(){
        $.get('/api/materias/', function(data){
            self.materias = data.results
            console.log(data)
            self.update()
        console.log(self)
        })
    })

    add(e){
            if(self.input_name.value && self.input_description.value){
            var materia = ({name: self.input_name.value, description: self.input_description.value})

            $.post('/api/materias/',materia , function(data){
                self.materias.push(data)
                console.log(materia)
                self.input_name.value = self.input_description.value = ''
                self.update()
           })
       }
   }

    delete(event){
       $.ajax(event.item.url, {
           type : 'DELETE',
           success: function(data){

                var remove_data = self.materias.indexOf(event.item)
                self.materias.splice(remove_data, 1)
                self.update()
           }
       })
   }
        
    edit(e){
       self.adding_item = false
       self.editing_item = e.item
       self.edit_name.value = e.item.name
       self.edit_description.value = e.item.description
   }
</materia>
