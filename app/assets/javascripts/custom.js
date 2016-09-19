/* Theme Name:iDea - Clean & Powerful Bootstrap Theme
 * Author:HtmlCoder
 * Author URI:http://www.htmlcoder.me
 * Author e-mail:htmlcoder.me@gmail.com
 * Version: 1.2.0
 * Created:October 2014
 * License URI:http://support.wrapbootstrap.com/
 * File Description: Place here your custom scripts
 */

$('#donate-plan [name="tax"]').click(function(e) {
  if (e.target.value === '1') {
    $('#merchantnumber').val(5010328);
  } else {
    $('#merchantnumber').val(5010327);
  }
});

$('#donate-one').submit(function(e) {
  var input;
  var form = $('#donate-one');
  var query = {};

  if ($('[name="tax"]:checked', form).val() === '1') {
    query['project_id'] = '274';
    query['reward_id'] = '1153';
    input = ['custom_field[1813]', 'custom_field[1814]', 'custom_field[1815]', 'custom_field[1816]', 'custom_field[1817]'];
    query['custom_field[1818]'] = '指定社民黨使用'
  } else {
    query['project_id'] = '74';
    query['reward_id'] = '247';
    input = ['custom_field[130]', 'custom_field[131]', 'custom_field[133]', 'custom_field[134]', 'custom_field[135]'];
    query['custom_field[136]'] = '指定社民黨使用'
  }

  $('.donate-input-group input', form).each(function(idx, item) {
    if (input[idx]) {
      query[input[idx]] = $(item).val();
    }
  });


  query['email'] = $('[name="email"]', form).val();
  query['additional_support'] = $('[name="additional_support"]', form).val();

  location.href = 'http://sdparty.backme.tw/cashflow/checkout?' + $.param(query);

  return false;
});
