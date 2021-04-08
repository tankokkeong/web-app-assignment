<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="upgrade.aspx.cs" Inherits="web_app_assignment.upgrade" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <title>Payment Gateway</title>
    <link href="style/upgrade.css" rel="stylesheet" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <script src="https://www.paypal.com/sdk/js?client-id=AdDOLLOLk2_J1EZhhXVYKJh7-Q0HC87201ipDZK4vUd1ILLBcIYzM462C7MWSWJ26aFV6j22IvQDYBTe"> // Replace YOUR_CLIENT_ID with your sandbox client ID
    </script>

    <%-- Payment Loader --%>
    <div class="payment-loader-container" style="display:none;" id="payment-loader">
        <div class="payment-inner-container">
            <div class="payment-loader">
                <div class="lds-spinner"><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div><div></div></div>
            </div>
    
            <div class="loader-text text-light">
                Payment processing...
            </div>
        </div>

    </div>


    <%-- Payer ID Hidden Field --%>
    <asp:HiddenField ID="payerID" runat="server" />

    <div class="payment-option-container">
        <div id="paypal-button-container" class="text-center">
            <h2 class="mb-3">Choose Your Payment Method</h2>
            <div class="google-pay-container text-center">
                <div id="container" class="google-pay-inner-container"></div>  
            </div>              
        </div>
    </div>


    <!-- Add the checkout buttons, set up the order and approve the order -->
    <script>
      paypal.Buttons({
        style: {
            size: 'responsive',
            layout: "vertical",
            color: "blue",
            label: "pay",
            fundingicons: 'true',
          },
          funding: {
              allowed: [paypal.FUNDING.CARD, paypal.FUNDING.CREDIT, paypal.FUNDING.VENMO, paypal.FUNDING.ELV,],
          },

        createOrder: function(data, actions) {
          return actions.order.create({
            purchase_units: [{
              amount: {
                value: '88.00'
              }
            }]
          });
        },
          onApprove: function (data, actions) {

              var payment_loader = document.getElementById("payment-loader");

              //Display Loader
              payment_loader.style.display = "";

              //Disable Scrolling
              $('html, body').css({
                  overflow: 'hidden',
                  height: '100%'
              });

          return actions.order.capture().then(function(details) {

              console.log(details)
              //Send post request
              $.post("upgrade.aspx",
                  {
                      upgrade_id: $("#ContentPlaceHolder1_payerID").val(),
                  },
                  function () {
                      //Remove Loader
                      payment_loader.style.display = "none";

                      //Disable Scrolling
                      $('html, body').css({
                          overflow: 'auto',
                          height: 'auto'
                      });

                      alert("Payment Successful!");

                      //Redirect Back to profile page
                      window.location.href = "upgrade.aspx?payment_successful=1";
                  });
          });
        }
      }).render('#paypal-button-container'); // Display payment options on your web page
    </script>

<script>
    /**
     * Define the version of the Google Pay API referenced when creating your
     * configuration
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#PaymentDataRequest|apiVersion in PaymentDataRequest}
     */
    const baseRequest = {
      apiVersion: 2,
      apiVersionMinor: 0
    };
    
    /**
     * Card networks supported by your site and your gateway
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#CardParameters|CardParameters}
     * @todo confirm card networks supported by your site and gateway
     */
    const allowedCardNetworks = ["AMEX", "DISCOVER", "INTERAC", "JCB", "MASTERCARD", "VISA"];
    
    /**
     * Card authentication methods supported by your site and your gateway
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#CardParameters|CardParameters}
     * @todo confirm your processor supports Android device tokens for your
     * supported card networks
     */
    const allowedCardAuthMethods = ["PAN_ONLY", "CRYPTOGRAM_3DS"];
    
    /**
     * Identify your gateway and your site's gateway merchant identifier
     *
     * The Google Pay API response will return an encrypted payment method capable
     * of being charged by a supported gateway after payer authorization
     *
     * @todo check with your gateway on the parameters to pass
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#gateway|PaymentMethodTokenizationSpecification}
     */
    const tokenizationSpecification = {
      type: 'PAYMENT_GATEWAY',
      parameters: {
        'gateway': 'example',
        'gatewayMerchantId': 'exampleGatewayMerchantId'
      }
    };
    
    /**
     * Describe your site's support for the CARD payment method and its required
     * fields
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#CardParameters|CardParameters}
     */
    const baseCardPaymentMethod = {
      type: 'CARD',
      parameters: {
        allowedAuthMethods: allowedCardAuthMethods,
        allowedCardNetworks: allowedCardNetworks
      }
    };
    
    /**
     * Describe your site's support for the CARD payment method including optional
     * fields
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#CardParameters|CardParameters}
     */
    const cardPaymentMethod = Object.assign(
      {},
      baseCardPaymentMethod,
      {
        tokenizationSpecification: tokenizationSpecification
      }
    );
    
    /**
     * An initialized google.payments.api.PaymentsClient object or null if not yet set
     *
     * @see {@link getGooglePaymentsClient}
     */
    let paymentsClient = null;
    
    /**
     * Configure your site's support for payment methods supported by the Google Pay
     * API.
     *
     * Each member of allowedPaymentMethods should contain only the required fields,
     * allowing reuse of this base request when determining a viewer's ability
     * to pay and later requesting a supported payment method
     *
     * @returns {object} Google Pay API version, payment methods supported by the site
     */
    function getGoogleIsReadyToPayRequest() {
      return Object.assign(
          {},
          baseRequest,
          {
            allowedPaymentMethods: [baseCardPaymentMethod]
          }
      );
    }
    
    /**
     * Configure support for the Google Pay API
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#PaymentDataRequest|PaymentDataRequest}
     * @returns {object} PaymentDataRequest fields
     */
    function getGooglePaymentDataRequest() {
      const paymentDataRequest = Object.assign({}, baseRequest);
      paymentDataRequest.allowedPaymentMethods = [cardPaymentMethod];
      paymentDataRequest.transactionInfo = getGoogleTransactionInfo();
      paymentDataRequest.merchantInfo = {
        // @todo a merchant ID is available for a production environment after approval by Google
        // See {@link https://developers.google.com/pay/api/web/guides/test-and-deploy/integration-checklist|Integration checklist}
        // merchantId: '12345678901234567890',
        merchantName: 'Example Merchant'
      };
      return paymentDataRequest;
    }
    
    /**
     * Return an active PaymentsClient or initialize
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/client#PaymentsClient|PaymentsClient constructor}
     * @returns {google.payments.api.PaymentsClient} Google Pay API client
     */
    function getGooglePaymentsClient() {
      if ( paymentsClient === null ) {
        paymentsClient = new google.payments.api.PaymentsClient({environment: 'TEST'});
      }
      return paymentsClient;
    }
    
    /**
     * Initialize Google PaymentsClient after Google-hosted JavaScript has loaded
     *
     * Display a Google Pay payment button after confirmation of the viewer's
     * ability to pay.
     */
    function onGooglePayLoaded() {
      const paymentsClient = getGooglePaymentsClient();
      paymentsClient.isReadyToPay(getGoogleIsReadyToPayRequest())
          .then(function(response) {
            if (response.result) {
              addGooglePayButton();
              // @todo prefetch payment data to improve performance after confirming site functionality
              // prefetchGooglePaymentData();
            }
          })
          .catch(function(err) {
            // show error in developer console for debugging
            console.error(err);
          });
    }
    
    /**
     * Add a Google Pay purchase button alongside an existing checkout button
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#ButtonOptions|Button options}
     * @see {@link https://developers.google.com/pay/api/web/guides/brand-guidelines|Google Pay brand guidelines}
     */
    function addGooglePayButton() {
      const paymentsClient = getGooglePaymentsClient();
      const button =
          paymentsClient.createButton({onClick: onGooglePaymentButtonClicked});
      document.getElementById('container').appendChild(button);
    }
    
    /**
     * Provide Google Pay API with a payment amount, currency, and amount status
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/request-objects#TransactionInfo|TransactionInfo}
     * @returns {object} transaction info, suitable for use as transactionInfo property of PaymentDataRequest
     */
    function getGoogleTransactionInfo() {
      return {
        countryCode: 'US',
        currencyCode: 'USD',
        totalPriceStatus: 'FINAL',
        // set to cart total
        totalPrice: '1.00'
      };
    }
    
    /**
     * Prefetch payment data to improve performance
     *
     * @see {@link https://developers.google.com/pay/api/web/reference/client#prefetchPaymentData|prefetchPaymentData()}
     */
    function prefetchGooglePaymentData() {
      const paymentDataRequest = getGooglePaymentDataRequest();
      // transactionInfo must be set but does not affect cache
      paymentDataRequest.transactionInfo = {
        totalPriceStatus: 'NOT_CURRENTLY_KNOWN',
        currencyCode: 'USD'
      };
      const paymentsClient = getGooglePaymentsClient();
      paymentsClient.prefetchPaymentData(paymentDataRequest);
    }
    
    /**
     * Show Google Pay payment sheet when Google Pay payment button is clicked
     */
    function onGooglePaymentButtonClicked() {
      const paymentDataRequest = getGooglePaymentDataRequest();
      paymentDataRequest.transactionInfo = getGoogleTransactionInfo();
    
      const paymentsClient = getGooglePaymentsClient();
      paymentsClient.loadPaymentData(paymentDataRequest)
          .then(function(paymentData) {
            // handle the response
            processPayment(paymentData);
          })
          .catch(function(err) {
            // show error in developer console for debugging
            console.error(err);
          });
    }
    /**
     * Process payment data returned by the Google Pay API
     *
     * @param {object} paymentData response from Google Pay API after user approves payment
     * @see {@link https://developers.google.com/pay/api/web/reference/response-objects#PaymentData|PaymentData object reference}
     */
    function processPayment(paymentData) {
      // show returned data in developer console for debugging
        console.log(paymentData);
      // @todo pass payment token to your gateway to process payment
      paymentToken = paymentData.paymentMethodData.tokenizationData.token;
    }</script>
    <script async
      src="https://pay.google.com/gp/p/js/pay.js"
      onload="onGooglePayLoaded()"></script>
</asp:Content>
