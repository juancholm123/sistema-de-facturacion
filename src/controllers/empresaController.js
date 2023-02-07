const controller = {}



controller.index_empresa = (req, res) => {
    res.render('./empresa/index')
}

controller.prefil = (req, res) => {
    res.render('./empresa/perfil')
}



export default controller