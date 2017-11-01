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

$('#donate-plan').submit(function(e) {
  var memo = '指定社民黨使用；';

  if (parseInt($('#donate-plan [name="anonymous"]:checked').val(), 10)) {
    memo += '匿名捐款；';
  } else {
    memo += '本名捐款；';
  }

  if (parseInt($('#donate-plan [name="receipt"]:checked').val(), 10)) {
    memo += '年底寄送；';
  } else {
    memo += '不需寄送；';
  }

  memo += '介紹人：' + $('#donate-plan [name="referrals"]').val();

  // alert(memo);
  $('#memo').val(memo);

  return true;
});

$('#donate-one').submit(function(e) {
  var input;
  var form = $('#donate-one');
  var query = {};

  var memo = '指定社民黨使用；';

  if (parseInt($('[name="anonymous"]:checked', form).val(), 10)) {
    memo += '匿名捐款；';
  } else {
    memo += '本名捐款；';
  }

  if (parseInt($('[name="receipt"]:checked', form).val(), 10)) {
    memo += '年底寄送；';
  } else {
    memo += '不需寄送；';
  }

  memo += '介紹人：' + $('[name="referrals"]', form).val();

  if ($('[name="tax"]:checked', form).val() === '1') {
    query['project_id'] = '274';
    query['reward_id'] = '1153';
    input = ['custom_field[1813]', 'custom_field[1814]', 'custom_field[1815]', 'custom_field[1816]', 'custom_field[1817]'];
    query['custom_field[1818]'] = memo;
  } else {
    query['project_id'] = '74';
    query['reward_id'] = '247';
    input = ['custom_field[130]', 'custom_field[131]', 'custom_field[133]', 'custom_field[134]', 'custom_field[135]'];
    query['custom_field[136]'] = memo;
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

$('.page-toggle .page-title').on('click', function(e) {
  $(e.target).parent().toggleClass('page-toggle-hide');
});
