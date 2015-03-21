namespace :db do
  desc "Fill database with sample data"
  task populate: :environment do

    User.delete_all
    Letter.delete_all
    Sender.delete_all
    user1 = User.create(name:'Collin Meyers', email:'cfmeyers@gmail.com', password:'123456', password_confirmation:'123456', mtname:'collin')
    user2 = User.create(name:'Kyle H', email:'kyle@kylemail.com', password:'123456', password_confirmation:'123456', mtname:'Kyle')
    user3 = User.create(name:'Ian Brown', email:'ianmichaelbrownie@gmail.com', password:'123456', password_confirmation:'123456', mtname:'Ian')
    sender1 = Sender.create(name:'papajohns.com', display_name: 'Papa Johns')
    sender2 = Sender.create(name: 'linkedin.com', display_name:'Linkedin')
    sender3 = Sender.create(name: 'slack.com', display_name:'Slack')
    sender4 = Sender.create(name: 'cuney.edu', display_name:'Cuny')


    user1.letters.create!(sender: sender1, content:"Today through Sunday, March 22nd, get a Large Cheese Pizza for just $5.99 when you carryout.", title:"Deal from Papa John's")
    user1.letters.create!(sender: sender2,content:" Welcome to Job Seeker Premium!  Over the next few weeks, we'll be sending you emails to show you all the great features you get with Job Seeker Premium, share our favorite job search tips, and help you track your progress.  To get started, learn how to:", title:"Welcome to Job Seeker Premium")
    user1.letters.build(sender: sender3,content:"You're invited BusyBusyLabs has started using Slack. The administrator, logan, has invited you to join.", title:"Jimbo has invited you to join BusybusyLabs on Slack")

    user1.letters.create!(sender: sender4,content: "THE THURSDAY BRIEF - MARCH 12, 2015 CUNY Photo Challenge
    Enter our monthly student photo competition by the 25th of every mouth and a chance to win an iPad! Check out February's winning image and capture your own compelling moment at CUNY. More »
    * * * * * *
    CUNY Lecture Series — Fighting for Justice
    In his powerful new memoir, Just Mercy: A Story of Justice and Redemption, Bryan Stevenson, founder of the Montgomery-based Equal Rights Initiative, reflects on his lifelong struggle to protect the rights of the disenfranchised at an event at Hunter College’s Roosevelt House. More »", title:"The Thursday Brief")

    user3.letters.create!(sender: sender1, content:"Today through Sunday, March 22nd, get a Large Cheese Pizza for just $5.99 when you carryout.", title:"Deal from Papa John's")
    user3.letters.create!(sender: sender2,content:" Welcome to Job Seeker Premium!  Over the next few weeks, we'll be sending you emails to show you all the great features you get with Job Seeker Premium, share our favorite job search tips, and help you track your progress.  To get started, learn how to:", title:"Welcome to Job Seeker Premium")
    user3.letters.build(sender: sender3,content:"You're invited BusyBusyLabs has started using Slack. The administrator, logan, has invited you to join.", title:"Jimbo has invited you to join BusybusyLabs on Slack")

    user3.letters.create!(sender: sender4,content: "THE THURSDAY BRIEF - MARCH 12, 2015 CUNY Photo Challenge 
    Enter our monthly student photo competition by the 25th of every mouth and a chance to win an iPad! Check out February's winning image and capture your own compelling moment at CUNY. More »
    * * * * * *
    CUNY Lecture Series — Fighting for Justice
    In his powerful new memoir, Just Mercy: A Story of Justice and Redemption, Bryan Stevenson, founder of the Montgomery-based Equal Rights Initiative, reflects on his lifelong struggle to protect the rights of the disenfranchised at an event at Hunter College’s Roosevelt House. More »", title:"The Thursday Brief")


    pj_body = <<eos
=================================================================
PAPA JOHN'S -- BETTER INGREDIENTS, BETTER PIZZA.
=================================================================

Score a FREE Pizza with an easy LAYUP!


How to Score Free Pizza:

1. Order $15 or more online by Monday, April 6, to qualify for a 
FREE Large Pizza with up to three toppings. Enter the promo code
LAYUP when you place your online order.

ORDER NOW!
http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f4396d8d2e1ecc093aea7f142ae576cd628672b7b5b0b80b78c259c7ee928ae69

2. 25 Bonus Papa Rewards points will be deposited in your
account the day after your qualifying order.

3. After the Bonus Points have been deposited into your account,
place an online order for a Large Pizza with up to three toppings.
Enter the promo code 25PAPA at checkout.

=================================================================

Online Only Offer. Offer good for a limited time at participating
Papa john's restaurants. Not valid with any other coupons or
discounts. Limited delivery area. Delivery fee may apply. Customer
responsible for all applicable taxes. Offer may vary in Alaska and
Hawaii. Offer not valid in Canada.

Valid only at participating U.S. restaurants. You must have or
create an account at www.papajohns.com,  be a member of the Papa
Rewards program, and be signed in to your account when ordering to
qualify. Using the promo code LAYUP automatically enrolls you in
Papa Rewards once you have an account. Offer is valid 3/23/15 to
4/6/15 and redemption of free pizza must occur no later than
4/19/15. One redemption per online account. Bonus points for free
pizza will not be deposited until the day after your qualifying
order has been completed. Additional toppings cost extra. By
participating in the promotion you agree to receive email
notifications related to this promo.

You have received this Email because you have selected the 
option to receive notices about specials and other online related 
information from us in your Email Preferences. 

Unsubscribe
http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f9039ec82@330f143895a96f1c7c7804c54a567f469b18ccd9f5c130a8dd@7e

Visit our privacy policy at http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f82e4e52ffae54d207862f55d2ffcc3bc390b81ea1b1e55818de71778cbe23572

Papa John's Online
consumer_services@papajohns.com
1-877-547-7272 (PAPA)
Company Address:
Papa John's
2002 Papa John's Blvd
Louisville, KY, 40299

(C) 2015 Papa John's International, Inc. All Rights Reserved.

=================================================================
eos

    pj_raw_html = <<END
<img src="http://click.papajohns-specials.com/open.aspx?ffcb10-fec310767c62067c-fdff1570756d067475107674-fef41375766c00-ff3715717065-fe2010727d600d74751176-ff231d74726c&d=10044" width="1" height="1">
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<style type="text/css">
body {display:block;}

body { 
    background-image: url('http://image.papajohns-specials.com/lib/fef41375766c00/m/1/layup-bb-background4.jpg');
    background-repeat: no-repeat;
    background-position: top; 
}

a {border:none; outline:none; text-decoration:none;}
a: hover {text-decoration:underline;}
</style>
</head>
<body>

<!-- BEGIN TABLE WRAPPER -->
<table width="600" align="center" cellpadding="0" cellspacing="0" border="0" bgcolor="#ffffff">
  <tr style="margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-family:Georgia, serif;">
    <td background="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/layup-bb-background.jpg" style="display: block;">

      <!-- BEGIN PRE-HEADER -->
      <table width="600" border="0" align="center" cellspacing="0" cellpadding="5">
        <tr>
          <td align="center"><a style="font-family: Arial, Helvetica, sans-serif; text-align: left; font-size: 11px;line-height:15px;color: #9e8e7b; font-weight: bold;"
          	href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f0243a99f7ac55206d58e9aa2af4a269ed6ba49600aa49a84ee959aabe935e904">
								Score a FREE Pizza when you use the promo code: LAYUP.</a>
								
						<br />
          </td>
        </tr>
      </table>
      <!-- END PRE-HEADER -->
			
			<!-- BEGIN HEADER -->
      <table width="600" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fd97d78d27dc518abc3e27d5a2b44e663a9f53eb485aa3de186cf9453c2d8728c">
								<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/01022015-NAT-banner.jpg" 
									width="600" height="114" alt="Papa John's - Better Ingredients. Better Pizza." /></a></td>
         
        </tr>
      </table>
      <!-- END HEADER --> 
			
			


      <!-- BEGIN HEADER -->
      <table width="600" height="348" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td width="161">
          <img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/layup-bb-header.jpg" width="600" height="348"
           alt="LAYUP: your best shot at Free Pizza!" />
           </td>
           </tr>
      </table>
      <!-- END HEADER -->


   



   <!--MAIN IMAGE TABLE BEGINS HERE -->
      <table width="600" height="75" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>
          <td valign="center">
           <div style="font-size:30px; font-weight:bold; color:#bb141a; text-align:center; font-family:Arial, Helvetica, sans-serif">HOW TO SCORE FREE PIZZA:</div>
          <BR/>
					</td>
        </tr>
      </table>

<!-- MAIN IMAGE TABLE ENDS HERE -->


<!--1ST TABLE STARTS HERE  -->
      <table width="600" height="115" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr>

<td width="59" height="115"></td>
<td width="71" height="115"><img src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/01_clock.jpg" width="71" height="60" alt="Step 1" /></td>
<td width="15" height="115"></td>

<td style="font-family:Arial, Helvetica, sans-serif; margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;
padding-left:0; vertical-align:top; font-size:14px;">

          <div style="font-size:21px; font-weight:bold; color:#bb141a;">PLACE AN ONLINE ORDER.</div><br />
					Order <span style="color:#bb141a; font-weight:bold;">$15 or more</span> online by <a href="#" style="color:#000; text-decoration: none;">Monday, April 6</a>, to qualify for a 
			FREE Large Pizza with up to three toppings. <br />

<br />
Enter the promo code <span style="color:#bb141a; font-weight:bold;">LAYUP</span> when you place your online order.</td>

</tr>
</table>

<!-- 1ST TABLE ENDS HERE -->



<!--BUTTON TABLE STARTS HERE -->
<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="202" height="59"></td>
    <td height="59"><a style="text-decoration:none; border:none;" href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f0243a99f7ac55206d58e9aa2af4a269ed6ba49600aa49a84ee959aabe935e904">
    <img src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/layup-bb_order-button.png" width="195" height="59" alt="ORDER NOW!" 
				style="display:block; font-size:12px;" border="0"/></a>
    </td>
    <td width="203" height="59"></td>
  </tr>
</table>

<!--BUTTON TABLE ENDS HERE -->



<!--SPACER TABLE STARTS HERE -->


<table width="600" height="25" border="0" cellspacing="0" cellpadding="0">
  <tr>
    
    <td width="600" style="font-family:Arial, Helvetica, sans-serif; margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0; 
			vertical-align:top; font-size:12px; text-align:center; vertical-align:center;">
			<br />


  </tr>
</table>

<!--SPACER TABLE ENDS HERE -->




<!--2ND TABLE BEGINS HERE -->

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    	<td width="59" height="113">&nbsp;</td>
    	<td width="71" height="113"><img src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/02_clock.jpg" width="71" height="60" alt="Step 2" /></td>
    	<td width="15" height="113">&nbsp;</td>
    	<td style="font-family:Arial, Helvetica, sans-serif; margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;
				padding-right:0;padding-left:0; vertical-align:center; font-size:14px;">

    <div style="font-size:21px; font-weight:bold; color:#bb141a;">WE'LL DEPOSIT POINTS.</div><br />
		25 Bonus Papa Rewards points will be deposited in your
		account<br /><span style="color:#bb141a; font-weight:bold;">
		the day after</span> your qualifying order.<br />
			</td>
	</tr>
</table>


<!--2ND TABLE ENDS HERE -->

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="600" height="40"></td>
  </tr>
</table>



<!-- 3RD TABLE STARTS HERE -->

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="59" height="161">&nbsp;</td>
    <td width="71" height="113" valign="center">
      <img src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/03_clock.jpg" width="71" height="60" alt="Step 3" /></td>
    <td width="15" height="161">&nbsp;</td>
    <td style="font-family:Arial, Helvetica, sans-serif; margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;
				padding-right:0;padding-left:0; vertical-align:top; font-size:14px;">

    <div style="font-size:21px; font-weight:bold; color:#bb141a;">REDEEM YOUR POINTS FOR A FREE PIZZA.</div>
      <br />
					After the Bonus Points have been deposited into your account, place<br /> an online order for a Large Pizza with up to three toppings. Enter the promo code <span style="color:#bb141a; font-weight:bold;">25PAPA</span> at checkout.<br />
		<br />
					You must redeem your Bonus Points by <span style="color:#bb141a; font-weight:bold;"><a href="#" style="color:#bb141a; text-decoration: none;">Sunday, April 19.</a></span><br/><br/>
                    
		</td>
  </tr>
</table>

<!-- 3RD TABLE ENDS HERE -->


<!--LINKS TABLE STARTS HERE -->

<table width="600" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="173" height="32">&nbsp;</td>
    
		<td style="font-family:Arial, Helvetica, sans-serif; margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;
				padding-left:0; vertical-align:bottom; text-align:center; font-size:12px;">
		</td>
    
		<td width="173" height="32">&nbsp;</td>
  </tr>
</table>

<!-- LINKS TABLE ENDS HERE -->



<!-- LOGO LOCKDOWN TABLE BEGINS HERE -->

<table width="600" height="50" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td style="padding-left:10px; padding-right:10px; font-family:Arial, Helvetica, sans-serif;"><center>
    
    <a style="color: #000000; text-decoration: underline; text-align: center; font-size: 14px; font-family: Arial, Helvetica, sans-serif;" 
				href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fb1c0586f7b44af438a368517227f5f0ceb4706c7c5ddd757b2b7f666c9a5aa5d">
				More Info</a>  /  <a style="color: #000000; text-decoration:underline; text-align:center; font-size:14px; font-family:Arial, Helvetica, sans-serif;" 
						href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f87af195243257c28d991e2c3e4748a8f59fc5301754daa5514ab9603398c897d"> FAQs</a>  /  U.S. Promotion only 
		
		</center>
   
    </td>
  </tr>
</table>


<!-- LOGO LOCKDOWN TABLE ENDS HERE -->


<!-- BEGIN FOOTER -->
<table width="600" height="40" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td width="145"><img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-connect-with-us.jpg" 
							width="145" height="40" alt="Connect with us!" />
					</td>
          
					<td width="39" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fef24f04836b8d8018a83854aea1a3c927c56387cafd2f5c2adb2c6ba3e0e52d7" 
							target="_blank"><img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-Facebook_1.jpg" 
							width="39" height="40" alt="Facebook" /></a>
					</td>
          
					<td width="41" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fe550b0f68f04e208cc299b837f7b062f32d31a12d2cd8112f1bdb01805bfe22c" target="_blank">
							<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-Twitter_2.jpg" 
								width="41" height="40" alt="Twitter" /></a>
					</td>
          
					<td width="39" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f7be6abe29b2f63992439f0e965e2ed53101cf2741ec499bb31520146ad9d954c" target="_blank">
							<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-YouTube_3.jpg" 
								width="39" height="40" alt="YouTube" /></a>
					</td>
          
					<td width="42" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f26e55f78ef72fdfdd44fafd98b8ef6a952a9ae5ece9cac045cee7cd18dd090bd">
							<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-Instagram_4.jpg" 
								width="42" height="40" alt="Instagram" /></a>
					</td>
          
					<td width="40" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f7916c68ecafb1a2bcc2630a348bb8f079a0bbc81500a8a0ef109ee0e3dfa80d1">
							<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-Pintrest_5.jpg" 
									width="40" height="40" alt="Pinterest" /></a>
					</td>
          
					<td width="132" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fe14f05f623e0e6b6cbde163c53721ad24f1e4b07844e7a7dec7b38d22f9f5083">
							<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-View-Specials.jpg" 
									width="132" height="40" alt="View Special Offers" /></a>
					</td>
          
					<td width="122" height="40"><a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f7b79794b0227303123d2c4f9b762c229e23487f782393167606e8eb28313b783">
							<img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Nat-Footer-Papa-Rewards.jpg" 
									width="122" height="40" alt="Papa Rewards" /></a>
					</td>
        </tr>
      </table>
      
			<table width="600" height="3" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td><img border="0" style="display:block; font-size:20px;" src="http://image.papajohns-specials.com/lib/fef41375766c00/m/1/PJ-Shadow_Footer.png" width="600" height="3" alt="" />
				</td>
        </tr>
      </table>
<!-- END FOOTER -->

<!-- BEGIN SUB-FOOTER -->
<table width="600" cellspacing="10" cellpadding="0" border="0" align="center" style="display:block;">
        <tr style="margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;">
          <td style="margin-top:0;margin-bottom:0;margin-right:0;margin-left:0;padding-top:0;padding-bottom:0;padding-right:0;padding-left:0;font-family:Arial, Helvetica, serif;">
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:13px;">
								<strong>Online Only Offer.</strong> Offer good for a limited time at participating Papa john's restaurants. Not valid with any other coupons or discounts. Limited delivery area. 
								Delivery fee may apply. Customer responsible for all applicable taxes. Offer may vary in Alaska and Hawaii. Offer not valid in Canada.
								<br />
								<br />
								Valid only at participating U.S. restaurants. You must have or create an account at <a style="color: #cc0000; text-decoration: underline;" href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f80f175d87bb3fb851e6dc74a3d82ef623ca9435199354a3ce72b75f40534a2c9">www.papajohns.com,</a> be 
								a member of the Papa Rewards program, and be signed in to your account when ordering to qualify. Using the promo code LAYUP automatically enrolls you in Papa Rewards once you have 
								an account. Offer is valid 3/19/15 to 4/6/15 and redemption of free pizza must occur no later than 4/19/15. One redemption per online account. Bonus points for free pizza will not 
								be deposited until the day after your qualifying order has been completed. Additional toppings cost extra. By participating in the promotion you agree to receive email notifications related to this promo. See <a  style="color: #cc0000; text-decoration: underline;" href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fad4e17db10ef190f1ec3ce4822718029324a7740001e4417b29210761baea041">Terms & Conditions.</a></span>
						</div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:10px;"> You have received 
								this Email because you have selected the option to receive notices about specials and other online related information from us in your Email Preferences. 
						</div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:10px;">Trouble viewing this email? 
								<a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6fb07d651d947303487ebfba9d74072deb3ab92bf0253e2992cd1a55f98ccf692a"><span style="color: #cc0000; text-decoration: underline;">View in browser.</span></a>
						</div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:13px;"> To ensure future 
								delivery of emails, please add <a href="mailto: specials@papajohns-specials.com" style="color:#cc0000;">specials@papajohns-specials.com</a> to your safe sender list or address book. 
						</div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:13px;">
								<a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f63ca3d83a99ed532227e72f289093c95baeef05292517b4d5d378652b03f364b"display:block; font-size:20px;" src=National&amp;en=03192015_LAYUP_BOUNCEBACK-KO&amp;bu=75384" class="copyrightwhite" 
										style="font-family: Arial, Helvetica, sans-serif; font-size: 10px; color: #9e8e7b;">Unsubscribe</a> 
						</div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:13px;">
								<a href="http://click.papajohns-specials.com/?qs=e33f1a33ae3a1e6f1ba38799f68709dab5a7bc4850ae81c09b4bd031733877e5751c545da243824a" style="color:#cc0000;text-decoration: underline;">Privacy Policy</a>
						</div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:13px;"> Papa John's 
								Online<br>
              <a href="mailto:consumer_services@papajohns.com" style="color:#cc0000;">consumer_services@papajohns.com</a><br>
              <a href="tel:1-877-547-7272" style="color:#cc0000;">1-877-547-7272</a><br>
              Company Address:<br>
              Papa John's<br>
              <a href="#" style="color:#9e8e7b;">2002 Papa John's Blvd<br>
              Louisville, KY 40299</a> </div>
            
						<div style="text-align:left; font-family: Arial, Helvetica, sans-serif; font-size: 10px; font-weight: normal; color: #9e8e7b; margin-bottom:10px; line-height:13px;"> 
							&copy;2015 Papa John's International, Inc. All Rights Reserved. 
						</div>
					</td>
        </tr>
  </table>

<!--/ END SUB-FOOTER -->
</td>
  </tr>
</table>
</body>
</html>
END

    user1.letters.create!(sender: sender1, content:pj_body, title:"Something", raw_html:pj_raw_html)
    user2.letters.create!(sender: sender1, content:pj_body, title:"Something", raw_html:pj_raw_html)
    user3.letters.create!(sender: sender1, content:pj_body, title:"Something", raw_html:pj_raw_html)
  end
end
