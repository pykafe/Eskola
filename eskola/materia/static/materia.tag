<materia>
    <h1>Hello World</h1>

    <ol>
        <li each={ materias }> { text } - { text }</li>
    </ol>
    <form onsubmit={ add }>
      Name
      <input name='text_input' type='text'/>
        
      Description
      <textarea name='description' type='text'/>
      <button onklick={ add }>Add</button>
    </form>

   
    var self = this
    self.items = opts.items
    self.materias = []
      
    self.on('mount', function(){
        $.get('/api/materias/', function(data){
            self.materias = data.results
            self.update()
        })
    })
    
    add(e){
      if( self.form.value){
      var materias = {text: self.text_input.value, description: self.text_area.value}
      $.post('/api/materias/', materia, function(data){
                self.materias.push(data)
                self.text_input.value = '',
                self.text_area.value = ''
                self.update()
            })
        }
    }
    
</materia>
