/*
 * ATTENTION: The "eval" devtool has been used (maybe by default in mode: "development").
 * This devtool is neither made for production nor for readable output files.
 * It uses "eval()" calls to create a separate source file in the browser devtools.
 * If you are trying to read the output file, select a different devtool (https://webpack.js.org/configuration/devtool/)
 * or disable the default devtool with "devtool: false".
 * If you are looking for production-ready output files, see mode: "production" (https://webpack.js.org/configuration/mode/).
 */
/******/ (() => { // webpackBootstrap
/******/ 	"use strict";
/******/ 	var __webpack_modules__ = ({

/***/ "./src/public/js/index.js":
/*!********************************!*\
  !*** ./src/public/js/index.js ***!
  \********************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony import */ var _pedido_js__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./pedido.js */ \"./src/public/js/pedido.js\");\n\n\n/* Pedido */\n_pedido_js__WEBPACK_IMPORTED_MODULE_0__[\"default\"].inicializar_datos();\n\n//# sourceURL=webpack://solictud-de-productos/./src/public/js/index.js?");

/***/ }),

/***/ "./src/public/js/pedido.js":
/*!*********************************!*\
  !*** ./src/public/js/pedido.js ***!
  \*********************************/
/***/ ((__unused_webpack___webpack_module__, __webpack_exports__, __webpack_require__) => {

eval("__webpack_require__.r(__webpack_exports__);\n/* harmony export */ __webpack_require__.d(__webpack_exports__, {\n/* harmony export */   \"default\": () => (__WEBPACK_DEFAULT_EXPORT__)\n/* harmony export */ });\nvar p = document.getElementById('pedido');\nvar pedido = {};\nif (p != null && p != undefined && p != \"\") {\n  var SelectEmpresa = document.getElementById('select-empresa');\n  var SelectMedida = document.getElementById('select-medida');\n  var SelectProducto = document.getElementById('select-producto');\n  pedido.inicializar_datos = function () {\n    fetch(\"/inicializar-datos-pedido\", {\n      method: \"POST\"\n    }).then(function (res) {\n      return res.json();\n    }).then(function (res) {\n      if (res.status == 'ok') {\n        console.log(res);\n        LlenarSelect(SelectEmpresa, res.empresa, \"empresa\");\n        LlenarSelect(SelectMedida, res.medidas, \"medida\");\n        LlenarSelect(SelectProducto, res.productos, \"producto\");\n      }\n    });\n  };\n  var LlenarSelect = function LlenarSelect(select, dato, elemento) {\n    dato.forEach(function (element) {\n      var option = document.createElement('option');\n      option.text = element[\"\".concat(elemento)];\n      select.appendChild(option);\n    });\n  };\n}\n/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (pedido);\n\n//# sourceURL=webpack://solictud-de-productos/./src/public/js/pedido.js?");

/***/ })

/******/ 	});
/************************************************************************/
/******/ 	// The module cache
/******/ 	var __webpack_module_cache__ = {};
/******/ 	
/******/ 	// The require function
/******/ 	function __webpack_require__(moduleId) {
/******/ 		// Check if module is in cache
/******/ 		var cachedModule = __webpack_module_cache__[moduleId];
/******/ 		if (cachedModule !== undefined) {
/******/ 			return cachedModule.exports;
/******/ 		}
/******/ 		// Create a new module (and put it into the cache)
/******/ 		var module = __webpack_module_cache__[moduleId] = {
/******/ 			// no module.id needed
/******/ 			// no module.loaded needed
/******/ 			exports: {}
/******/ 		};
/******/ 	
/******/ 		// Execute the module function
/******/ 		__webpack_modules__[moduleId](module, module.exports, __webpack_require__);
/******/ 	
/******/ 		// Return the exports of the module
/******/ 		return module.exports;
/******/ 	}
/******/ 	
/************************************************************************/
/******/ 	/* webpack/runtime/define property getters */
/******/ 	(() => {
/******/ 		// define getter functions for harmony exports
/******/ 		__webpack_require__.d = (exports, definition) => {
/******/ 			for(var key in definition) {
/******/ 				if(__webpack_require__.o(definition, key) && !__webpack_require__.o(exports, key)) {
/******/ 					Object.defineProperty(exports, key, { enumerable: true, get: definition[key] });
/******/ 				}
/******/ 			}
/******/ 		};
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/hasOwnProperty shorthand */
/******/ 	(() => {
/******/ 		__webpack_require__.o = (obj, prop) => (Object.prototype.hasOwnProperty.call(obj, prop))
/******/ 	})();
/******/ 	
/******/ 	/* webpack/runtime/make namespace object */
/******/ 	(() => {
/******/ 		// define __esModule on exports
/******/ 		__webpack_require__.r = (exports) => {
/******/ 			if(typeof Symbol !== 'undefined' && Symbol.toStringTag) {
/******/ 				Object.defineProperty(exports, Symbol.toStringTag, { value: 'Module' });
/******/ 			}
/******/ 			Object.defineProperty(exports, '__esModule', { value: true });
/******/ 		};
/******/ 	})();
/******/ 	
/************************************************************************/
/******/ 	
/******/ 	// startup
/******/ 	// Load entry module and return exports
/******/ 	// This entry module can't be inlined because the eval devtool is used.
/******/ 	var __webpack_exports__ = __webpack_require__("./src/public/js/index.js");
/******/ 	
/******/ })()
;