require "sinatra"
require "sinatra/reloader"

get("/") do
  '<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>
<form action="/square/results">
  <div>
    <label for="user_number">Enter a number</label>
  </div>
  <div>
    <input type="text" name="number" id="user_number" placeholder="What number do you want to take the square of?">
  </div>
  <button>Calculate square</button>
</form>'
end

get("/square/new") do
'<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>
<form action="/square/results">
  <div>
    <label for="user_number">Enter a number</label>
  </div>
  <div>
    <input type="text" name="number" id="user_number" placeholder="What number do you want to take the square of?">
  </div>
  <button>Calculate square</button>
</form>'
end

get("/square/results") do
  @number = params.fetch("number").to_f
  @squared_num = @number ** 2
 table = '<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>'

results = "<h1>Square Results</h1> <dt> Number </dt>"+ "<dd> #{@number} </dd>" +  "<dt> Square </dt>" + "<dd> #{@squared_num} </dd>" + '<a href="/square/new"> Calculate another square </a>'
return table + results
end

get("/square_root/new") do
'<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>
<form action="/square_root/results">
  <div>
    <label for="number_input">
      Enter a number
    </label>

    <input id="number_input" text="text" name="user_number" placeholder="What number do you want to take the square root of?">
  </div>

  <button>
    Calculate square root
  </button>
</form>'
end
get("/square_root/results") do
  @number = params.fetch("user_number").to_f
  @sqr_root = @number ** 0.5
  table = '<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>'

results = "<h1>Square Results</h1> <dt> Number </dt>"+ "<dd> #{@number} </dd>" +  "<dt> Square </dt>" + "<dd> #{@sqr_root} </dd>" + '<a href="/square/new"> Calculate another square </a>'
return table + results
end

get("/payment/new") do
  '<table style="width: 100%" border="1">
    <tbody><tr>
      <td>
        <strong>Calculators</strong>
      </td>
  
      <td>
        <a href="/square/new">
          Square with Form
        </a>
      </td>
  
      <td>
        <a href="/square_root/new">
          Square Root with Form
        </a>
      </td>
  
      <td>
        <a href="/payment/new">
          Payment with Form
        </a>
      </td>
  
      <td>
        <a href="/random/new">
          Random with Form
        </a>
      </td>
    </tr>
  </tbody></table>
  <form action="/payment/results">
  <div>
    <label for="apr_input">
      APR
    </label>

    <input id="apr_input" text="text" name="user_apr" placeholder="E.g. 5.42">
  </div>

  <div>
    <label for="years_input">
      Number of years
    </label>

    <input id="years_input" text="text" name="user_years" placeholder="How many years to repay?">
  </div>
  <div>
  <label for="principal_input">
    Principal
  </label>

  <input id="principal_input" text="text" name="user_pv" placeholder="How much principal?">
</div>

<button>
  Calculate monthly payment
</button>
</form>'
end

get("/payment/results") do
  @apr = params.fetch("user_apr").to_f
  @apr_percent = params.fetch("user_apr").to_f.to_fs(:percentage, {:precision => 4})
  @monthly_apr = (@apr / (100 * 12))
  @years = params.fetch("user_years").to_f 
  @periods = @years * 12
  @principal = params.fetch("user_pv").to_f
  @principal_currency = @principal.to_s(:currency)
  @payment = ((@monthly_apr * @principal).to_f/(1 - (1 + @monthly_apr) ** -@periods)).to_fs(:currency)
  table = '<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>'

results = "<h1>Payment Results</h1> <dt> APR </dt>"+ "<dd> #{@apr_percent} </dd>" +  "<dt> Number of Years </dt>" + "<dd> #{@years} </dd>" + "<dt> Principal </dt>" + "<dd> $#{@principal} </dd>"+ "Payment </dt>" + "<dd> #{@payment} </dd>"+ '<a href="/square/new"> Calculate another square </a>'
return table + results
end

get("/random/new") do
  '<table style="width: 100%" border="1">
    <tbody><tr>
      <td>
        <strong>Calculators</strong>
      </td>
  
      <td>
        <a href="/square/new">
          Square with Form
        </a>
      </td>
  
      <td>
        <a href="/square_root/new">
          Square Root with Form
        </a>
      </td>
  
      <td>
        <a href="/payment/new">
          Payment with Form
        </a>
      </td>
  
      <td>
        <a href="/random/new">
          Random with Form
        </a>
      </td>
    </tr>
  </tbody></table>
  <form action="/random/results">
  <div>
    <label for="min_input">
      Minimum
    </label>

    <input id="min_input" text="text" name="user_min" placeholder="E.g. 1.5">
  </div>

  <div>
    <label for="max_input">
      Maximum
    </label>

    <input id="max_input" text="text" name="user_max" placeholder="E.g. 4.5">
  </div>

  <button>
    Pick random number
  </button>
</form>'
end

get("/random/results") do
  @min = params.fetch("user_min").to_f 
  @max = params.fetch("user_max").to_f 
  @number = rand(@min..@max).to_f
  
  table = '<table style="width: 100%" border="1">
  <tbody><tr>
    <td>
      <strong>Calculators</strong>
    </td>

    <td>
      <a href="/square/new">
        Square with Form
      </a>
    </td>

    <td>
      <a href="/square_root/new">
        Square Root with Form
      </a>
    </td>

    <td>
      <a href="/payment/new">
        Payment with Form
      </a>
    </td>

    <td>
      <a href="/random/new">
        Random with Form
      </a>
    </td>
  </tr>
</tbody></table>'

results = "<h1>Random Results</h1> <dt> Minimum </dt>"+ "<dd> #{@min} </dd>" +  "<dt> Maximum </dt>" + "<dd> #{@max} </dd>" + "<dt> Random Number </dt>" + "<dd> #{@number} </dd>" + '<a href="/square/new"> Calculate another square </a>'
return table + results
end
