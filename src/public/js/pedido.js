import Empresa from './empresa.js';
import Producto from './producto.js';
const SelectEmpresa = document.getElementById('select-empresa');
const SelectProducto = document.getElementById('select-producto');
const SelectMedida = document.getElementById('select-medida');
const label_precio = document.getElementById('precio-producto');
const label_total = document.getElementById('precio-total');
const campo_cantidad = document.getElementById('cantidad');

export default class Pedido {

    constructor() {
        this.Empresa = new Empresa()
        this.Producto = new Producto()
    }



    inicializar_pedido() {
        this.Empresa.consultar_todas_las_empresas().then((result) => {
            this.Empresa.setTodasLasEmpresas = result
            this.LlenarSelect(SelectEmpresa, this.Empresa.getTodasLasEmpresas.empresa, "empresa")
        }).catch((err) => {
            console.log(err);
        });
    }
    LlenarSelect(select, dato, elemento) {
        select.innerHTML = "";
        dato.forEach(element => {
            const option = document.createElement('option');
            option.text = element[`${elemento}`];
            select.appendChild(option);
        });
    }

    /*   inicializar_pedido() {
          this.Empresa.consultar_todas_las_empresas().then((result) => {
              if (result == "Se consultaron todas las empresas con exito") {
                  this.LlenarSelect(SelectEmpresa, this.Empresa.obtener_todas_las_empresas.empresa, "empresa")
                  this.Producto.consultar_producto_por_empresa(SelectEmpresa.value).then((result) => {
                      if (result == "Se obtuvo los productos por empresa de manera exitosa") {
                          this.LlenarSelect(SelectProducto, this.Producto.obtener_producto_por_empresa.producto, "producto");
                          this.Producto.consultar_medidas_de_los_producto(SelectEmpresa.value, SelectProducto.value).then((result) => {
                              if (result == "se consultaron las medidas por producto de manera exitosa") {
                                  this.LlenarSelect(SelectMedida, this.Producto.obtener_medidadas_por_producto.medida, "medida");
                                  label_precio.innerText = "PRECIO: " + this.Producto.obtener_medidadas_por_producto.medida[0].precio + "$" + " POR " + this.Producto.obtener_medidadas_por_producto.medida[0].medida
                                  campo_cantidad.value = 1
                                  this.Producto.consultar_unica_medida_del_producto(SelectEmpresa.value,SelectProducto.value,SelectMedida.value).then((result) => {
                                      label_total.innerText = "TOTAL: " + this.calcular_precio(this.Producto.obtener_medidadas_por_producto.medida[0].precio) + "$"
                                     
                                   
                                  }).catch((err) => {
                                      console.log(err);
                                  });
                              }
                          }).catch((err) => {
                              console.log(err);
                          });
                      }
                  }).catch((err) => {
                      console.log(err);
                  });
              }
          }).catch((err) => {
              console.log(err);
          });
      }
   

   cambiar_de_empresa() {
       SelectEmpresa.addEventListener('change', (event) => {
           this.Producto.consultar_producto_por_empresa(SelectEmpresa.value).then((result) => {
               if (result == "Se obtuvo los productos por empresa de manera exitosa") {
                   this.LlenarSelect(SelectProducto, this.Producto.obtener_producto_por_empresa.producto, "producto");
                   this.Producto.consultar_medidas_de_los_producto(SelectEmpresa.value, SelectProducto.value).then((result) => {
                       if (result == "se consultaron las medidas por producto de manera exitosa") {
                           this.LlenarSelect(SelectMedida, this.Producto.obtener_medidadas_por_producto.medida, "medida");
                           label_precio.innerText = "PRECIO: " + this.Producto.obtener_medidadas_por_producto.medida[0].precio + "$" + " POR " + this.Producto.obtener_medidadas_por_producto.medida[0].medida
                           campo_cantidad.value = 1
                           this.Producto.consultar_unica_medida_del_producto(SelectEmpresa.value, SelectProducto.value, SelectMedida.value).then((result) => {
                               label_total.innerText = "TOTAL: " + this.calcular_precio(this.Producto.obtener_medidadas_por_producto.medida[0].precio) + "$"
                           }).catch((err) => {
                               console.log(err);
                           });
                       }
                   }).catch((err) => {
                       console.log(err);
                   });
               }
           }).catch((err) => {
               console.log(err);
           });
       });
   }

   cambiar_de_producto() {
       SelectProducto.addEventListener('change', (event) => {
           this.Producto.consultar_medidas_de_los_producto(SelectEmpresa.value, SelectProducto.value).then((result) => {
               if (result == "se consultaron las medidas por producto de manera exitosa") {
                   this.LlenarSelect(SelectMedida, this.Producto.obtener_medidadas_por_producto.medida, "medida");
                   label_precio.innerText = "PRECIO: " + this.Producto.obtener_medidadas_por_producto.medida[0].precio + "$" + " POR " + this.Producto.obtener_medidadas_por_producto.medida[0].medida
                   campo_cantidad.value = 1
                   this.Producto.consultar_unica_medida_del_producto(SelectEmpresa.value, SelectProducto.value, SelectMedida.value).then((result) => {
                       label_total.innerText = "TOTAL: " + this.calcular_precio(this.Producto.obtener_medidadas_por_producto.medida[0].precio) + "$"
                   }).catch((err) => {
                       console.log(err);
                   });
               }
           }).catch((err) => {
               console.log(err);
           });
       })
   }

   cambiar_de_medida() {
       SelectMedida.addEventListener('change', (event) => {
           campo_cantidad.value = 1
           this.Producto.consultar_unica_medida_del_producto(SelectEmpresa.value, SelectProducto.value, SelectMedida.value).then((result) => {
               if (result == "Se consulto la unica medida del producto de manera exitosa") {
                   label_precio.innerText = "PRECIO: " + this.Producto.obtener_unica_medida_del_producto.medida[0].precio + "$" + " POR " + this.Producto.obtener_unica_medida_del_producto.medida[0].medida
                   label_total.innerText = "TOTAL: " + this.calcular_precio(this.Producto.obtener_unica_medida_del_producto.medida[0].precio) + "$"
               }
           }).catch((err) => {
               console.log(err);
           });
       })
   }

   calcular_precio(precio) {
       if (campo_cantidad.value > 0 && campo_cantidad.value != undefined && campo_cantidad.value != "" && campo_cantidad.value != null) {
           this.cantidad = campo_cantidad.value * precio
           return this.cantidad
       }

   }


   detectar_cantidad() {
       campo_cantidad.addEventListener('keyup', (event) => {
           if (campo_cantidad.value > 0) {
               label_total.innerText = "TOTAL: " + this.calcular_precio(this.Producto.obtener_unica_medida_del_producto.medida[0].precio) + "$"
           } else {
               label_total.innerText = "TOTAL: " + this.Producto.obtener_unica_medida_del_producto.medida[0].precio
           }
       }, false);
   }



   LlenarSelect(select, dato, elemento) {
       select.innerHTML = "";
       dato.forEach(element => {
           const option = document.createElement('option');
           option.text = element[`${elemento}`];
           select.appendChild(option);
       });
   }


*/
}
