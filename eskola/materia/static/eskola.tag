<eskola>
    <h3>Hello World</h3>

    <div each={ materias }>
        { name } { description }
        <button onclick={ parent.delete } >DELETE</button>
    </div>

    <form onsubmit={ add }>
        <input name="input_name" onkeyup={ edit_key }>
        <input name="input_description" onkeyup={ edit_key }>
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
                self.materias.push(materia)
                console.log(materia)
                self.input_name.value = self.input_description.value = ''
                self.update()
           })
       }
   }

   delete(event){
       $.ajax(event.item.url, {
           method : 'DELETE',
           success: function(materia){
                var remove_data = self.materias.indexOf(event.item)
                self.materias.splice(remove_data, 1)
                self.update()
           }
       })
   }


</eskola>
