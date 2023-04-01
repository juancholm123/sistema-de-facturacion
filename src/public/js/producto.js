export default class Producto {


    constructor() {
        this.producto = ""
        this.descipcion = ""
        this.estado = ""
        this._obj_productos_por_empresa = ""
        this._obj_productos_por_empresa_por_medida = ""
        this._obj_meidas_por_producto = ""
        this._obj_unica_medida_del_producto = ""
    }


    consultar_producto_por_empresa(empresa) {
        return new Promise((resolve, reject) => {
            var datos = new URLSearchParams();
            datos.append("empresa", empresa);
            fetch("/consultar-producto-por-empresa", {
                method: "POST",
                body: datos,
            }).then(res => res.json()).then(res => {
                if (res.status == 200) {
                    /*  this._obj_productos_por_empresa = res
                     resolve("Se obtuvo los productos por empresa de manera exitosa") */
                } else {
                    reject("Hubo un error al consultar los productos por empresa")
                }

            })
        })

    }


    consultar_medidas_de_los_producto = (empresa, producto) => {
        return new Promise((resolve, reject) => {
            var datos = new URLSearchParams();
            datos.append("empresa", empresa);
            datos.append("product", producto);
            fetch("/consultar-medidas-por-producto", {
                method: "POST",
                body: datos,
            }).then(res => res.json()).then(res => {
                if (res.status == 200) {
                    //  this._obj_meidas_por_producto = res
                    //  resolve("se consultaron las medidas por producto de manera exitosa")
                } else {
                    reject("Hubo un error al consultar las medidas por producto")
                }

            })
        })
    }

    consultar_unica_medida_del_producto(empresa, producto, medida) {
        return new Promise((resolve, reject) => {
            var datos = new URLSearchParams();
            datos.append("empresa", empresa);
            datos.append("product", producto);
            datos.append("medida", medida);
            fetch("/consultar-unica-medida-del-producto", {
                method: "POST",
                body: datos,
            }).then(res => res.json()).then(res => {
                if (res.status == 200) {
                    /* this._obj_unica_medida_del_producto = res
                    resolve("Se consulto la unica medida del producto de manera exitosa") */
                } else {
                    reject("Hubo un error al consultar la unica medida del producto")
                }

            })
        })
    }

    get getProductoPorEmpresa() {
        return this._obj_productos_por_empresa
    }

    get getProductoPorEmpresaPorMeedida() {
        return this._obj_productos_por_empresa_por_medida
    }

    get getMedidadasPorProducto() {
        return this._obj_meidas_por_producto
    }

    get getUnicaMedidaDelProducto() {
        return this._obj_unica_medida_del_producto
    }

    


}
