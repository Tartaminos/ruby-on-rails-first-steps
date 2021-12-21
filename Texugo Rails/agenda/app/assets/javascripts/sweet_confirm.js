var sweetAlertConfirmConfig = sweetAlertConfirmConfig || {}; // Add default config object
​
(function( $ ) {
​
   var sweetAlertConfirm = function(link) {
​
    swalDefaultOptions = {
      title: sweetAlertConfirmConfig.title || 'Are you sure?',
      showCancelButton: sweetAlertConfirmConfig.showCancelButton || true,
      confirmButtonColor: '#5cb85c', //"#DD6B55" removed by Noc, do not apply default color as it triggers inline styles on buttons
      cancelButtonColor:  '#d9534f', //"#DD6B55" removed by Noc, do not apply default color as it triggers inline styles on buttons
      //Null causes javascript errors when hover is fired on confirm buttons
      confirmButtonText: sweetAlertConfirmConfig.confirmButtonText || "Confirmar",
      cancelButtonText: sweetAlertConfirmConfig.cancelButtonText || "Cancelar",
      confirmButtonClass: 'btn btn-sm btn-success',
      cancelButtonClass: 'btn btn-sm btn-danger'
    }
    // if (sweetAlertConfirmConfig.confirmButtonColor !== null) {
    //   swalDefaultOptions.confirmButtonColor = sweetAlertConfirmConfig.confirmButtonColor
    // }
​
      $linkToVerify = $(link)
      var swalOptions = swalDefaultOptions;
      var optionKeys = [
                          'confirm',
                          'text',
                          'sweetAlertType',
                          'showCancelButton',
                          'confirmButtonColor',
                          'cancelButtonColor',
                          'confirmButtonText',
                          'cancelButtonText',
                          'closeOnConfirm',
                          'html',
                          'imageUrl',
                          'allowOutsideClick',
                          'customClass',
                          'remote',
                          'method',
                          'function'
                        ];
      
      function afterAlertCallback(r){
        if (nameFunction) {
          window[nameFunction]();
        }
        if (swalOptions['remote'] === true) {
          if (r === false) {
            return false;
          } else {
            $.rails.handleRemote($linkToVerify)
          }
        }
        else if(swalOptions[ 'method' ] !== undefined) {
          if (r === false) {
            return false;
          } else {
            $.rails.handleMethod($linkToVerify);
          }
        }
        else {
          if (r === false) {
            return false;
          } else {
            if($linkToVerify.attr('type') == 'submit' || $linkToVerify.attr('submit-form') == 'true'){
              var name = $linkToVerify.attr('name'),
              data = name ? {name: name, value:$linkToVerify.val()} : null;
              $linkToVerify.closest('form').data('ujs:submit-button', data);
              $linkToVerify.closest('form').submit();
            }
            else {
              window.location.href = $linkToVerify.attr('href');
            }
      
          }
        }
      }
      
      var beforeFunction = null;
      
      $.each($linkToVerify.data(), function(key, val){
        if ($.inArray(key, optionKeys) >= 0) {
          swalOptions[key] = val
          if (key == 'sweetAlertType') {
            swalOptions['type'] = val;
          }
        }
        // Make a before callback to verify that swal should be shown
        if(key == 'sabeforefunction') {
          beforeFunction = val;
        }
      });
      
      // Skip alert if false
      if(beforeFunction != null) {
        var beforeRes = window[beforeFunction]($linkToVerify);
        if(beforeRes === true) {
          return afterAlertCallback(true); // Skip alert
        }
      }
​
      var nameFunction = swalOptions['function'];
      message = $linkToVerify.attr('data-confirm')
      swalOptions['title'] = message
      swal(swalOptions).then(function(isConfirm) {
        if (typeof isConfirm === "undefined") {
          isConfirm = false;
        }
        afterAlertCallback(isConfirm);
      });
​
      return false;
  }
​
  $.rails.allowAction = function(link) {
    if(link.data('confirm')){
      sweetAlertConfirm(link);
      return false;
    }else{
      return true;
    }
  };
​
  // $.rails.confirmed = function(link) {
  //   link.removeAttr('data-confirm');
  //   return link.trigger('click.rails');
  // };
​
  // $.rails.showConfirmDialog = function(link) {
  //   return swal({
  //     title: 'Are you sure?',
  //     text: 'This cannot be undone!',
  //     type: 'warning',
  //     showCancelButton: true,
  //     confirmButtonColor: '#DD6B55',
  //     confirmButtonText: 'Delete',
  //     cancelButtonText: 'Cancel',
  //     closeOnConfirm: false,
  //     closeOnCancel: false
  //   }, function(isConfirm) {
  //     if (isConfirm) {
  //       swal('Deleted!', 'Student has been deleted!.', 'success', $.rails.confirmed(link));
  //     } else {
  //       swal('Cancelled', 'Student delete has been cancelled', 'error');
  //     }
  //   });
  // };
​
 
​
  // $(document).on('ready turbolinks:load page:update ajaxComplete', function() {
  //   $(document).off('click.sweetConfirm');
  //   $(document).on('click.sweetConfirm', '[data-confirm]', sweetAlertConfirm);
  //   // $('[data-confirm]:not(.on-sweet-alert-confirm)').on('click', sweetAlertConfirm);
  //   // $('[data-confirm]:not(.on-sweet-alert-confirm)').addClass('on-sweet-alert-confirm');
  // });
​
  // $(document).on('ready turbolinks:load page:load', function() {
  //   //To avoid "Uncaught TypeError: Cannot read property 'querySelector' of null" on turbolinks
  //   if (typeof window.sweetAlertInitialize === 'function') {
  //     window.sweetAlertInitialize();
  //   }
  // });
​
​
})( jQuery );