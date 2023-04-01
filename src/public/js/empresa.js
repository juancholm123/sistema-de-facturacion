
export default class Empresa {



    constructor() {
        this._id = ""
        this._municipio = ""
        this._empresa = ""
        this._descripcion = ""
        this._obj_empresas = ""
    }

    consultar_todas_las_empresas() {
        return new Promise((resolve, reject) => {
            fetch("/consultar-todas-las-empresas", {
                method: "GET",
            }).then(res => res.json()).then(res => {
                if (res.status == 200) {
                    resolve(res)
                } else {
                    reject("Hubo un error al consultar todas las empresas")
                }
            })
        });
    }

    get getId() {
        return this.id
    }
    get getEmpresa() {
        return this._empresa
    }

    get getMunicipio() {
        return this._municipio
    }
    get getDescripcion() {
        return this._empresa
    }

    get getTodasLasEmpresas() {
        return this._obj_empresas
    }


    set setTodasLasEmpresas(empresas) {
        this._obj_empresas = empresas
    }





}


