module.exports = {
    // otras opciones de configuración de webpack
    resolve: {
      fallback: {
        crypto: require.resolve('crypto-browserify'),
      },
    },
  };