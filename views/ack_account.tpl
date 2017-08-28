<!DOCTYPE html>
<html>
  <head>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.5/css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="{{ url('static', filename='csvCommon.css') }}" />
    <link rel="stylesheet" type="text/css" href="{{ url('static', filename='ack_account.css') }}" />
  </head>

  <body>

    % DATE = 0
    % EMAIL = 1
    % REAL_GROUP = 2
    % PHONE = 3
    % SPONSOR = 4
    % SPONSOR_AFF = 5
    % PROJECT = 6


    <div class="container">

      <form action="/ack_account" method="post" enctype="multipart/form-data">
	<fieldset class="fieldset-auto-width">
	  
	  <table class="col-md-12">
	    <tr>
	      <th></th>
	      <th>Date</th>
	      <th>Email</th>
	      <th>Group</th>
	      <th>Phone</th>
	      <th>Sponsor</th>
	      <th>Sponsor Affiliation</th>
	      <th>Project Description</th>
	    </tr>
	    
	    % totalList = usersList + ackList	
	    
	    % for user in totalList:
	    % if user in ackList:
	    <tr style="color:red">
	      <td>[ACK]
		% else:
		<tr>
		  <td><input type="checkbox" name="ackAccounts" value="{{user[EMAIL]}}">
		    % end
		  </td>
		  <td>{{user[DATE]}}</td>
		  <td>{{user[EMAIL]}}</td>
		  <td><select name = {{user[EMAIL]}}>
		      % for displayGroup in groupsList:
		      % if groupsDict[displayGroup] == user[REAL_GROUP].strip():
		      <option value={{displayGroup}} selected>{{displayGroup}}</option>
		      % else:	
		      <option value={{displayGroup}}>{{displayGroup}}</option>
		      % end
		      % end
		  </select></td>
		  <td>{{user[PHONE]}}</td>
		  <td>{{user[SPONSOR]}}</td>
		  <td>{{user[SPONSOR_AFF]}}</td>
		  <td>{{user[PROJECT]}}</td>
		</tr>		
		% end
		
	  </table>
	  <br>
	  <input type = "submit" value = "Submit" id = "submit"/>
	  
	</fieldset>
      </form>
  </body>
</html>
