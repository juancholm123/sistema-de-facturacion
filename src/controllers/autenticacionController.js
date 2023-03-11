const controller = {}



controller.login = (req, res) => {
     res.render('./autenticacion/login') 
  
}

controller.registro = (req, res) => {
    res.render('./autenticacion/registro')
}





export default controller