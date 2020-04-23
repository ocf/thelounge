// NOTE: This file is not actually used in production. 
// The production file is located in the Puppet private 
// docker share since it contains secrets.
module.exports = {
  public: true,
  host: '0.0.0.0',
  port: 9000,
  bind: '0.0.0.0',
  displayNetwork: false,
  lockNetwork: true,

  defaults: {
    name: "OCF IRC",
    host: "irc.ocf.berkeley.edu",
    port: 6697,
    tls: true,
    nick: "",
    username: "",
    realname: "",
    join: "#rebuild"
  },
}
