<eskola>

    <h3>Hello World</h3>

    <div each={ materias }>
        { name } { description }
        <button onclick={ delete } >DELETE</button>
        <button onclick={ edit } >Edit</button>
    </div>


    <div if={ editing_item }>
        Name:
        <input name="edit_name">
        Description:
        <textarea name="edit_description"></textarea>
        <button onclick={ edit_save } >PUT</button>
        <button onclick={ stop_edit } >Stop</button>
    </div>


    <form onsubmit={ add }>
        Name:
        <input name="input_name" onkeyup={ edit_key }>
        Description:
        <textarea name="input_description" onkeyup={ edit_key }></textarea>
        <button disabled={ !text }>Add # { materias.length + 1 }</button>
    </form>

        
    var self = this
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

    edit_key(e){
        self.text = e.target.value
    }

    add(e){
        if(self.input_name && self.input_description){
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
           method : 'DELETE',
           success: function(data){
                var remove_data = self.materias.indexOf(event.item)
                self.materias.splice(remove_data, 1)
                self.update()
           }
       })
   }

   edit(e){
       self.editing_item = e.item
       self.edit_name.value = e.item.name
       self.edit_description.value = e.item.description
   }

   stop_edit(e){
       self.editing_item = false
   }

   edit_save(e){
       self.editing_item.name = self.edit_name.value
       self.editing_item.description = self.edit_description.value
       $.ajax(self.editing_item.url, {
           method: 'PATCH',
           data: self.editing_item,
           success: function(data){
               self.editing_item = false
               self.update()
           }
       })
   }

</eskola>
