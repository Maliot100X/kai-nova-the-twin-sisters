module.exports = {
  apps: [{
    name: 'kai-nova-the-twin-sisters',
    script: 'src/kai-nova.js',
    cwd: __dirname,
    autorestart: true,
    watch: false,
    max_memory_restart: '200M',
    env: {
      NODE_ENV: 'production'
    }
  }]
};