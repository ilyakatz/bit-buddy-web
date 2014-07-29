class ChainVerifier

  constructor: ->
    @api_key = "acc0b268c4e36d6bd5d2c0d6ef5ffb20"

  verify: (address)->
    url = "https://api.chain.com/v1/bitcoin/addresses/#{address}"
    $.ajax(
      context: @
      url: url
      type: 'GET'
      beforeSend: (xhr) ->
        xhr.setRequestHeader('Authorization', "Basic #{btoa(@api_key)}")
      success: (data)->
        wallet = data.hash
        walletInput = $("#contact_wallet")
        walletInput.siblings(".warning").remove()

        if data.balance == 0
          link = $("<a>")
            .attr("href", "https://chain.com/bitcoin/addresses/#{wallet}")
            .html("activity")
            .attr("target", "_blank")
          warning = $("<div>")
            .addClass("warning")
            .html("This wallet doesn't have any ")
            .append(link)
          #debugger
          warning.html( warning.html() + ". Are you sure you want to add it?")
          walletInput.after(warning)
          @

    )

@BitBuddy.ChainVerifier = ChainVerifier
