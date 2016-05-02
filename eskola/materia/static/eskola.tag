<eskola>
    <h3>Hello World</h3>

    <div each={ materias }>
        { name } { description }
    </div>

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

</eskola>
