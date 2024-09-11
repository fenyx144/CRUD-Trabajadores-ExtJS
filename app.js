/**
 * @author Diego Rivas Revilla
 */
Ext.Loader.setConfig({enabled: true});

Ext.application({
    name: 'ExtMVC',

    controllers: [
        'Trabajadores'
    ],

    autoCreateViewport: true
});
