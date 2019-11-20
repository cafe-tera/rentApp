const express = require('express')
const Usuario = require('../models/usuario')
const bcrypt = require('bcrypt')
const _ = require('underscore')

const app = express()

app.get('/usuario', function(req, res) {

    let desde = req.query.desde || 0
    desde = Number(desde)

    let limite = req.query.limite || 16
    limite = Number(limite)

    Usuario.find({ estado: true }, 'nombre email telefono estado img')
        .skip(desde)
        .limit(limite)
        .exec((err, usuarios) => {
            if (err) {
                return res.status(400).json({
                    ok: false,
                    err
                })
            }

            Usuario.count({ estado: true }, (err, conteo) => {
                res.json({
                    ok: true,
                    cuantos: conteo,
                    usuarios
                })
            })
        })
})

app.post('/usuario', function(req, res) {

    let body = req.body

    let usuario = new Usuario({
        nombre: body.nombre,
        email: body.email,
        telefono: body.telefono,
        password: bcrypt.hashSync(body.password, 10),
        role: body.role
    })

    usuario.save((err, usuarioDB) => {
        if (err) {
            return res.status(400).json({
                ok: false,
                err
            })
        }

        // usuarioDB.password = null
        res.json({
            ok: true,
            usuario: usuarioDB
        })
    })
})

app.put('/usuario/:id', function(req, res) {

    let id = req.params.id
    let body = _.pick(req.body, ['nombre', 'email', 'img', 'role', 'estado'])
    console.log(req.body);
    Usuario.findByIdAndUpdate(id, body, { new: true, runValidators: true }, (err, usuarioDB) => {
        if (err) {
            return res.status(400).json({
                ok: false,
                err
            })
        }
        res.json({
            ok: true,
            usuario: usuarioDB
        })
    })
})

app.delete('/usuario/:id', function(req, res) {
    let id = req.params.id

    let cambiaEstado = {
        estado: false
    }
    Usuario.findByIdAndUpdate(id, cambiaEstado, { new: true }, (err, usuarioBorrado) => {

        // Usuario.findByIdAndRemove(id, (err, usuarioBorrado) => {
        if (err) {
            return res.status(400).json({
                ok: false,
                err
            })
        }

        if (!usuarioBorrado) {
            return res.status(400).json({
                ok: false,
                err: {
                    mensaje: 'Usuario no encontrado'
                }
            })
        }

        res.json({
            ok: true,
            usuario: usuarioBorrado
        })
    })
})

module.exports = app;