

export default class AutenticacionController {
    constructor() {

    }

    login = (req, res) => {
        res.render('./autenticacion/login')

    }

    registro = (req, res) => {
        res.render('./autenticacion/registro')
    }

}