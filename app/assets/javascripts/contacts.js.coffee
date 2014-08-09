#= require _chain

$("#contact_wallet").bind("change input", (e)->
  wallet = $(e.target).val();
  console.log wallet
  new BitBuddy.ChainVerifier().verify(wallet)
  @
)
