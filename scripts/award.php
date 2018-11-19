<?php ob_start(); session_start(); ?>
<html>
	<head>
		<meta charset="utf-8"/>
<?php
$servername = "localhost:3306";
$username = "application";
$password = "applicationPASSWORD";
$dbname = "untitled_review_website";

$conn = new mysqli($servername, $username, $password, $dbname);
$error = false;
if ($conn->connect_error) {
	$error = true;
}
else {
	$sql = "SELECT awardName FROM Award WHERE awardOrganization = \"" . $_GET['id'] . "\"";
	$result = $conn->query($sql);

	if (!($result->num_rows > 0)) {
		echo "<title>Page Not Found | Untitled Review Website</title>";
		$_GET['validOrg'] = false;
	} else {
		echo "<title>" . $_GET['id'] . " | Untitled Review Website</title>";
	}
}

$conn->close();		
?>
		<link href="style.css" rel="stylesheet" type="text/css">
		
		<div id="top">
			<a class="header-link" href="<?php echo "http://" . $_SERVER['HTTP_HOST']; ?>"><h1>Untitled Review Website</h1></a>
			<span class="separator"><b>|</b></span>
			<h2>The “leading” source for TV reviews, ratings, and awards</h2>
		</div>
		
	</head>
	<body>
		<div class="column-left">
<?php
function adP($rawHTML, $key, $required=false, $size=20){
	$missing = "<span class=\"no-rating\">N/A</span>";
	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
		if ($required){
			return "<input type=\"text\" size=\"" . $size . "\" name=\"" . $key . "\" required value=\"" . $rawHTML . "\">";
		} else {
			return "<input type=\"text\" size=\"" . $size . "\" name=\"" . $key . "\" value=\"" . $rawHTML . "\">";			
		}
	} else {
		return empty($rawHTML) ? $missing : $rawHTML;
	}
}

function checkMySQLDate($dateString){
	$dateComponents = explode("-", $dateString);
	if (count($dateComponents) != 3 || !checkDate(intval($dateComponents[1]), intval($dateComponents[2]), intval($dateComponents[0]))) {
		return false;
	}
	return true;
}

$awardID = $_GET['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $awardID;

$servername = "localhost:3306";
$username = "application";
$password = "applicationPASSWORD";
$dbname = "untitled_review_website";
	  
$conn = new mysqli($servername, $username, $password, $dbname);

if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
	$username = $_SESSION['username'];
	$password = $_SESSION['password'];

	$adminConn = new mysqli($servername, $username, $password, $dbname);
}

if (isset($_GET['id']) && !$conn->connect_error && (!isset($adminConn) || !$adminConn->connect_error)) {
	if (isset($_POST['update'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$id = empty($_POST['id']) ? "NULL" : $_POST['id'];
				
			$sql = "UPDATE Award
					SET awardOrganization = \"" . $id . "\"
					WHERE awardOrganization = \"" . $awardID . "\"";
			$adminConn->query($sql);
			
			unset($_POST['update']);
			unset($_POST['id']);
			header('Location: /award?id=' . htmlspecialchars($id));
		}
	} else if (isset($_POST['delete'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$sql = "DELETE FROM Award
					WHERE awardOrganization = \"" . $awardID . "\"";
			$adminConn->query($sql);
			unset($_POST['delete']);
		}
	} else if (isset($_POST['updateAward'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$oldName = "\"" . $_POST['oldName'] . "\"";
			$name = empty($_POST['name']) ? "NULL" : "\"" . $_POST['name'] . "\"";
			
			$sql = "SELECT awardName
					FROM Award
					WHERE awardName = " . $name . "
						AND awardOrganization = \"" . $awardID . "\"";						
			$conn->query($sql);
			
			$sql = "UPDATE Award
					SET awardName = " . $name . "
					WHERE awardOrganization = \"" . $awardID . "\"
						AND awardName = " . $oldName;						
			$adminConn->query($sql);
			
			unset($_POST['updateAward']);
			unset($_POST['oldName']);
			unset($_POST['name']);
		}
	} else if (isset($_POST['deleteAward'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {	
			$oldName = empty($_POST['oldName']) ? "NULL" : $_POST['oldName'];
			
			$sql = "DELETE FROM Award
					WHERE awardOrganization = \"" . $awardID . "\"
						AND awardName = \"" . $oldName . "\"";
			$adminConn->query($sql);
			
			unset($_POST['deleteAward']);
			unset($_POST['name']);
		}
	}  else if (isset($_POST['deleteAwardCrew'])) {
		if (!isset($adminConn)){
			$entryError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$awardName = $_POST['awardName'];
			$awardDate = $_POST['awardDate'];
			$progID = $_POST['progID'];
			$crewID = $_POST['deleteAwardCrew'];
			
			$sql = "DELETE FROM AwardForProgramForCrewPerson
					WHERE awardOrganization = \"" . $awardID . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND crewID = " . $crewID;
			$adminConn->query($sql);
			
			unset($_POST['deleteAwardCrew']);
		}
	} else if (isset($_POST['addAwardCrew'])) {
		if (!isset($adminConn)){
			$entryError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$awardName = $_POST['awardName'];
			$awardDate = $_POST['awardDate'];
			$progID = $_POST['progID'];
			$crewName = $_POST['addAwardCrewName'];
			
			if (empty($crewName)) {
				$entryError = "<p>Crew name cannot be empty for " . $awardName . ".</p>";				
			} else {			
				$sql = "SELECT crewID
						FROM CrewPerson
						WHERE name = \"" . $crewName . "\"";
				$result = $conn->query($sql);	
				
				if ($result->num_rows > 0) {
					$row = $result->fetch_assoc();
					$crewID = $row['crewID'];
				
					$sql = "SELECT crewID
							FROM WorksOn
							WHERE crewID = \"" . $crewID . "\"
								AND progID = " . $progID;
					$result = $conn->query($sql);		
					
					if ($result->num_rows > 0) {
						$sql = "INSERT INTO AwardForProgramForCrewPerson (awardOrganization, awardName, date, progID, crewID) VALUES
								(\"" . $awardID . "\", \"" . $awardName . "\", '" . $awardDate . "', " . $progID . ", " . $crewID . ")";

						$adminConn->query($sql);	
						
						unset($_POST['addAwardCrew']);
						unset($_POST['awardName']);
						unset($_POST['awardDate']);
						unset($_POST['progID']);
					} else {
				
						$sql = "SELECT name
								FROM Program
								WHERE progID = " . $progID;
						$result = $conn->query($sql);		
						
						if ($result->num_rows > 0) {
							$row = $result->fetch_assoc();
							$progName = $row['name'];
						} else {
							$progName = "this program";
						}
						
						$entryError = "<p>Crew person " . $crewName . " did not work on " . $progName . " for " . $awardName . ".<p>";
					}
				} else {
					$entryError = "<p>Crew person " . $crewName . " does not exist for " . $awardName . ".<p>";
				}
			}
		}
	} else if (isset($_POST['deleteAwardEntry'])) {
		if (!isset($adminConn)){
			$entryError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$awardName = $_POST['awardName'];
			$awardDate = $_POST['awardDate'];
			$progID = $_POST['progID'];
			
			$sql = "DELETE FROM AwardForProgram
					WHERE awardOrganization = \"" . $awardID . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND progID = " . $progID;
			$adminConn->query($sql);
			
			$sql = "DELETE FROM Award
					WHERE awardOrganization = \"" . $awardID . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'";
			$adminConn->query($sql);
	
			unset($_POST['deleteAwardEntry']);
		}
	} else if (isset($_POST['updateAwardEntry'])) {
		if (!isset($adminConn)){
			$entryError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$awardName = $_POST['awardName'];
			$awardDate = $_POST['awardDate'];
			$progID = $_POST['progID'];
			
			$wonIndex = str_replace(' ', '_', $_POST['updateAwardEntry'] . "&^won");		
			$won = $_POST[$wonIndex];
			
			$sql = "UPDATE AwardForProgram
					SET won = " . ($won ? "TRUE" : "FALSE") . "
					WHERE awardOrganization = \"" . $awardID . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND progID = " . $progID;
			$adminConn->query($sql);
			
			unset($_POST['updateAwardEntry']);
			unset($_POST[$wonIndex]);
		}
	}
	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<form action=\"" . $selfURL . "\" method=\"post\">";
	}
	
	$title = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
		("<input type=\"text\" class=\"title\" name=\"id\" size=\"30\" value=\"" . $_GET['id'] . "\">") : 
		$_GET['id'];
	
	echo "<span class=\"padded-content-header\"><h3>Awards from the " . $title . "</h3></span>";	

	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<button type=\"submit\" name=\"update\">Update</button>";
		echo "<button type=\"submit\" name=\"delete\">Delete</button>";
		echo "</form>";
	}
	
	$missing = "<span class=\"no-rating\">N/A</span>";
	$admin_missing = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "" : $missing;
		
	if (isset($awardError)) {
		echo $awardError;
	}
	
	$sql = "SELECT DISTINCT(awardName)
			FROM Award
			WHERE awardOrganization = \"" . $awardID . "\"";
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) {
		echo "<p>Here is a list of awards given to programs at the " . $awardID . ".</p>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
			echo "<p>To add awards, go to the appropriate program pages.</p>";
		}
		
		if (isset($entryError)) {
			echo $entryError;
		}
		
		while ($row = $result->fetch_assoc()) {
			$awardName = $row['awardName'];
			$urlEncoded = htmlspecialchars($awardName);
			
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<form action=\"" . $selfURL . "#" . $urlEncoded . "\" method=\"post\">
						<input type=\"hidden\" name=\"id\" value=\"" . $awardID . "\">
						<input type=\"hidden\" name=\"oldName\" value=\"" . $awardName . "\">";
			}
			
			$title = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
				("<input type=\"text\" class=\"title\" name=\"name\" size=\"30\" value=\"" . $awardName . "\">") : 
				$awardName;
			
			echo "<span id=\"" . $urlEncoded . "\" class=\"padded-content-header\"><h3>" . $title . "&nbsp;</h3></span>";	

			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<button type=\"submit\" name=\"updateAward\">Update</button>
						<button type=\"submit\" name=\"deleteAward\">Delete</button>
					<p></p></form>";
			}
			
			$innerSql = "SELECT P.programID, P.showName, P.season, P.episode, 
						P.programName, P.releaseDate, A.date, A.won
					FROM AwardForProgram A, AllReleases P
					WHERE A.progID = P.programID
						AND A.awardOrganization = \"" . $awardID . "\"
						AND A.awardName = \"" . $awardName . "\"
					ORDER BY date DESC";
					
			$innerResult = $conn->query($innerSql);
					
			if ($innerResult->num_rows > 0) {
				echo "<form action=\"" . $selfURL . "#" . $urlEncoded . "\" method=\"post\">
					<table class=\"listing\">
					<tr>
						<th>Program Name</th>
						<th>Date</th>
						<th>Won</th>
						<th>Nominated Crew</th>";
				
				if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
					echo "<th>Manage</th>";
				}
				
				echo "</tr>";
				
				while ($innerRow = $innerResult->fetch_assoc()) {
					$progID = $innerRow['programID'];
					$date = $innerRow['date'];
					$comb = $awardName . "&^" . $progID . "&^" . $date;
					
					$checked = ($innerRow['won']) ? "checked" : "";
					$won = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
						("<td align=\"center\"><input type=\"checkbox\" name=\"" . $comb . "&^won\"" . $checked . "></td>") : $innerRow['won'];
						
						
					$link = "http://" . $_SERVER['HTTP_HOST']. "/program?id=" . $innerRow["programID"];
					$showDescriptor = ($innerRow["showName"] === null) ? "" : "<span class=\"show-descriptor\"><i>" . $innerRow["showName"]. "</i>
						S" . $innerRow["season"]. "E" . $innerRow["episode"]. "</span><br/>";
					$showTitle = "<a href=\"" . $link . "\">" . $innerRow["programName"] . "</a>";
					
					echo "<tr>
							<td>" . $showDescriptor. " " . $showTitle. "</td>
							<td align=\"center\">" . $date . "</td>";	
						
					if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
						echo $won;
					} else if ($innerRow['won']){
						echo "<td class=\"won\" align=\"center\">Won</td>";
					} else {
						echo "<td class=\"nominated\" align=\"center\">Nominated</td>";				
					}
					
					$innerInnerSql = "SELECT C.crewID, C.name
								FROM AwardForProgramForCrewPerson A, CrewPerson C
								WHERE A.crewID = C.crewID
									AND A.awardOrganization = \"" . $awardID . "\"
									AND A.awardName = \"" . $awardName . "\"
									AND A.date = '" . $innerRow['date'] . "'
									AND A.progID = " . $progID;
					$innerInnerResult = $conn->query($innerInnerSql);
					
					if ($innerInnerResult->num_rows > 0 || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) {
						echo "<td align=\"center\">";
						
						while ($innerInnerResult->num_rows > 0 && $innerInnerRow = $innerInnerResult->fetch_assoc()) {
							$awardButton = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "<button type=\"submit\" name=\"deleteAwardCrew\" class=\"small-inline\" 
								value=\"" . $innerInnerRow['crewID'] . "\">Delete</button>" : "";
							echo "<p><form action=\"" . $selfURL . "#" . $urlEncoded . "\" method=\"post\">
									<input type=\"hidden\" name=\"awardName\" value=\"" . $awardName . "\">
									<input type=\"hidden\" name=\"awardDate\" value=\"" . $date . "\">
									<input type=\"hidden\" name=\"progID\" value=\"" . $progID . "\">
									<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/crew?id=" . $innerInnerRow['crewID'] . "\">
									" . $innerInnerRow['name'] . "</a>" . $awardButton . "</form></p>";
						}
						
						if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
							echo "<p><form action=\"" . $selfURL . "#" . $urlEncoded . "\" method=\"post\">
									<input type=\"hidden\" name=\"awardName\" value=\"" . $awardName . "\">
									<input type=\"hidden\" name=\"awardDate\" value=\"" . $date . "\">
									<input type=\"hidden\" name=\"progID\" value=\"" . $progID . "\">
									<input type=\"text\" size=\"5\" name=\"addAwardCrewName\">
									<button class=\"small-inline\" type=\"submit\" name=\"addAwardCrew\">Add</button>
								</form></p></td>";
						}
					} else {
						echo "<td align=\"center\">" . $missing . "</td>";
					}
					
					if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
						echo "<td align=\"center\" width=\"50px\">
								<button class=\"small-inline\" type=\"submit\" name=\"updateAwardEntry\" value=\"" . $comb . "\">Update</button>
								<button class=\"small-inline\" type=\"submit\" name=\"deleteAwardEntry\" value=\"" . $comb . "\">Delete</button>
							</td>";
					}
					
					echo "</tr>";
				}
			
				echo "</table></form>";
			} else {
				echo "<p>No results available...</p>";			
			}
		}
	} else {
		echo "<p>Award information is not available...</p>";
	}
} else {
	echo "<span class=\"content-header\"><h3>Not Found</h3></span>
		<p>Award information is not available...</p>";
}

$conn->close();
?>
		</div>
		<div class="column-right">
<?php
$awardID = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $awardID;

if (isset($_SESSION['logged_in']) && !isset($_POST['logout'])) {	
	$user_descriptor = "<b>" . $_SESSION['username'] . "</b>";
	
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
		$servername = "localhost:3306";
		$username = "application";
		$password = "applicationPASSWORD";
		$dbname = "untitled_review_website";

		$conn = new mysqli($servername, $username, $password, $dbname);
		if (!$conn->connect_error) {
			$sql = "SELECT name FROM Critic WHERE dbUsername = '" . $_SESSION['username'] . "'";
			$result = $conn->query($sql);

			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$user_descriptor = "<b>" . $row['name'] . "</b> (" . $_SESSION['username'] . ")";
			}
		}
		$conn->close();
	}
	
	echo "<div id=\"account\">
			<span class=\"content-header\"><h3>Account</h3></span>
					<p>Welcome, " . $user_descriptor . "</b>!</p>";
			
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
		echo "<p>Search for a program to add a review to, or click 
			<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/critic_management\">here</a>
			to view and update your reviews.</p>";
	}
	if(isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<p>Click <a href=\"http://" . $_SERVER['HTTP_HOST'] . "/admin_management\">here</a>
			to add data to the review website database.</p>";		
	}
	
	echo "<form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
			<input type=\"hidden\" name=\"id\" value=\"" . $awardID . "\">
			<button type=\"submit\" name=\"logout\">Logout</button>
		  </form>
		  </div>";
} else { 
	if (isset($_POST['logout'])){
		unset($_SESSION['logged_in']);
		unset($_SESSION['username']);
		unset($_SESSION['password']);
		unset($_SESSION['is_critic']);
		unset($_SESSION['is_admin']);
		header('Location: ' . $selfURL);
	}
	
	$servername = "localhost:3306";
	$username = htmlspecialchars($_POST['username']);
	$password = htmlspecialchars($_POST['password']);
	$dbname = "untitled_review_website";
	
	echo "<div id=\"login-form\">
		  <span class=\"content-header\"><h3>Login</h3></span>
		  <form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
			<input type=\"hidden\" name=\"id\" value=\"" . $awardID . "\">
			<table class=\"plain\">
				<tr>
					<td>Username</td>
					<td><input type=\"text\" name=\"username\" 
						value=\"" . (isset($_POST['username']) ? $_POST['username'] : '') . "\"</td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type=\"password\" name=\"password\" 
						value=\"" . (isset($_POST['password']) ? $_POST['password'] : '') . "\"</td>
				</tr>
				<tr>
					<td><button type=\"submit\" name=\"login\">Login</button></td>
				</tr>
			</table>
		  </form>";

	if (isset($_POST['login'])) {
		if (!empty($username) && !empty($password)) {
			$verify_error = false;
			
			$conn = new mysqli($servername, $username, $password, $dbname);		
			if ($conn->connect_error) {
				$verify_error = true;
			} else {
				$_SESSION['logged_in'] = true;
				$_SESSION['username'] = $username;
				$_SESSION['password'] = $password;
			}		
			$conn->close();
			$conn = new mysqli($servername, "application", "applicationPASSWORD", $dbname);		
			if ($conn->connect_error) {
				$verify_error = true;
			} else {
				$sql = "SELECT FROM_USER FROM mysql.role_edges WHERE TO_USER = '" . $username . "'";
				$result = $conn->query($sql);
				
				$_SESSION['is_critic'] = false;
				$_SESSION['is_admin'] = false;		
				
				if ($result->num_rows > 0) {
					while ($row = $result->fetch_assoc()) {
						if ($row['FROM_USER'] == 'Critic'){
							$_SESSION['is_critic'] = true;
						} else if ($row['FROM_USER'] == 'Administrator'){
							$_SESSION['is_admin'] = true;
						}
					}
				} else {
					$verify_error = true;
				}
			}		
			$conn->close();
			
			if ($verify_error) {
				echo "<p>Invalid login, please try again...</p>";
			} else {
				header('Location: ' . $selfURL);
			}
		} else if (empty($username)) {
			echo "<p>Please enter a username.</p>";
		} else {
			echo "<p>Please enter a password.</p>";
		}
	}
}
?>
			  </div>
	</body>
</html>