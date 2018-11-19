<?php ob_start(); session_start(); ?>
<html>
	<head>
		<meta charset="utf-8"/>		
		<title>Administrator Management | Untitled Review Website</title>		
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
function checkMySQLDate($dateString){
	$dateComponents = explode("-", $dateString);
	if (count($dateComponents) != 3 || !checkDate(intval($dateComponents[1]), intval($dateComponents[2]), intval($dateComponents[0]))) {
		return false;
	}
	return true;
}

function isNullOrNumeric($string, $checkPercent=false){
	if ($string == "NULL"){
		return true;
	} else {
		return ((is_numeric($string) && floatval($string) > 0) && 
		(!checkPercent || floatval($string) <= 100));
	}
}

$servername = "localhost:3306";
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$dbname = "untitled_review_website";

if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
	echo "<span class=\"content-header\"><h3>Administrator Management</h3></span>";
		  
	$error = false;
	$conn = new mysqli($servername, $username, $password, $dbname);

	if ($conn->connect_error) {
		echo "<p>Management options are not available, please try again later...</p>";
	} else {
		if (isset($_POST['newSerial'])){	
			$serialName = $_POST['serialName'];
			
			$sql = "INSERT INTO Serial (name) VALUES
					(\"" . $serialName . "\")";
			$conn->query($sql);
			
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$serialID = $row['LAST_INSERT_ID()'];
				unset($_POST['newSerial']);
				unset($_POST['serialName']);
				header('Location: /serial?id=' . $serialID);
			} else {
				$serialError = "<p>The serial could not be added. Please try again later.</p>";
			}		
		} else if (isset($_POST['newFilm'])){	
			$filmName = $_POST['filmName'];
			$releaseDate = empty($_POST['filmReleaseDate']) ? "NULL" : $_POST['filmReleaseDate'];
			$runtime = empty($_POST['filmRuntime']) ? "NULL" : $_POST['filmRuntime'];
			$budget = empty($_POST['filmBudget']) ? "NULL" : $_POST['filmBudget'];
			if ($releaseDate != "NULL" && !checkMySQLDate($releaseDate)) {
				$filmError = "<p>Invalid date.</p>";
			} else if (!isNullOrNumeric($runtime)) {
				$filmError = "<p>Runtime must be a non-zero number.</p>";		
			} else if (!isNullOrNumeric($budget)) {
				$filmError = "<p>Budget must be a non-zero number.</p>";					
			} else {	
				if ($releaseDate != "NULL") {
					$releaseDate = "'" . $releaseDate . "'";
				}
				
				$sql = "INSERT INTO Program (name, releaseDate, runtime, budget) VALUES
						(\"" . $filmName . "\", " . $releaseDate . ", " . $runtime . ", " . $budget . ")";
				$conn->query($sql);
				
				$sql = "SELECT LAST_INSERT_ID()";
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$row = $result->fetch_assoc();
					$progID = $row['LAST_INSERT_ID()'];
				
					$sql = "INSERT INTO Film (progID) VALUES
							(" . $progID . ")";
					$conn->query($sql);
					
					unset($_POST['newFilm']);
					unset($_POST['filmName']);
					unset($_POST['filmRuntime']);
					unset($_POST['filmBudget']);
					header('Location: /program?id=' . $progID);
				} else {
					$filmError = "<p>The film could not be added. Please try again later.</p>";
				}		
			}
		} else if (isset($_POST['newCrew'])){	
			$crewName = $_POST['crewName'];
			$birthdate = empty($_POST['crewBD']) ? "NULL" : $_POST['crewBD'];
			$deathdate = empty($_POST['crewDD']) ? "NULL" : $_POST['crewDD'];
			if ($birthdate != "NULL" && !checkMySQLDate($birthdate)) {
				$crewError = "<p>Invalid birth date.</p>";
			} else if ($deathdate != "NULL" && !checkMySQLDate($deathdate)) {
				$crewError = "<p>Invalid death date.</p>";
			} else {	
				if ($birthdate != "NULL") {
					$birthdate = "'" . $birthdate . "'";
				}
				
				if ($deathdate != "NULL") {
					$deathdate = "'" . $deathdate . "'";
				}
				
				$sql = "INSERT INTO CrewPerson (name, birthdate, deathdate) VALUES
						(\"" . $crewName . "\", " . $birthdate . ", " . $deathdate . ")";
				$conn->query($sql);
				
				$sql = "SELECT LAST_INSERT_ID()";
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$row = $result->fetch_assoc();
					$crewID = $row['LAST_INSERT_ID()'];
					
					unset($_POST['newCrew']);
					unset($_POST['crewName']);
					unset($_POST['crewBD']);
					unset($_POST['crewDD']);
					header('Location: /crew?id=' . $crewID);
				} else {
					$crewError = "<p>The crew member could not be added. Please try again later.</p>";
				}		
			}
		} else if (isset($_POST['newPlatform'])){	
			$platformName = $_POST['platformName'];
			$isNetwork = ($_POST['isNetwork']) ? "TRUE" : "FALSE";
				
			$sql = "INSERT INTO Platform (name, isNetwork) VALUES
					(\"" . $platformName . "\", " . $isNetwork . ")";
			$conn->query($sql);
			
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$platformID = $row['LAST_INSERT_ID()'];
				
				unset($_POST['newPlatform']);
				unset($_POST['platformName']);
				unset($_POST['isNetwork']);
				header('Location: /platform?id=' . $platformID);
			} else {
				$platformError = "<p>The platform could not be added. Please try again later.</p>";
			}		
		} else if (isset($_POST['newPublication'])){	
			$publicationName = $_POST['publicationName'];
				
			$sql = "INSERT INTO Publication (publicationName) VALUES
					(\"" . $publicationName . "\")";
			$conn->query($sql);
			
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {				
				unset($_POST['newPublication']);
				unset($_POST['publicationName']);
				header('Location: /publication?id=' . $publicationName);
			} else {
				$platformError = "<p>The publication could not be added. Please try again later.</p>";
			}		
		} else if (isset($_POST['deleteCritic'])){						
			$sql = "DELETE FROM Review
					WHERE reviewID IN (SELECT reviewID
										FROM CriticWrites
										WHERE reviewerID = " . $_POST['deleteCritic'] . ")";
			$conn->query($sql);		
			
			$sql = "DELETE FROM Critic
					WHERE reviewerID = " . $_POST['deleteCritic'];
			$conn->query($sql);		
			
			unset($_POST['deleteCritic']);	
		} else if (isset($_POST['deleteIP'])){					
			$sql = "DELETE FROM Review
					WHERE reviewID IN (SELECT reviewID
										FROM UserReview
										WHERE reviewerID = " . $_POST['deleteIP'] . ")";
			$conn->query($sql);	
			
			$sql = "DELETE FROM User
					WHERE reviewerID = " . $_POST['deleteIP'];
			$conn->query($sql);		
			
			unset($_POST['deleteIP']);	
		} else if (isset($_POST['addCritic'])){		
			$criticName = $_POST['criticName'];
				
			$sql = "INSERT INTO Critic (name) VALUES
					(\"" . $criticName . "\")";
			$conn->query($sql);
			
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {		
				$row = $result->fetch_assoc();
				$criticID = $row['LAST_INSERT_ID()'];
				
				unset($_POST['addCritic']);
				unset($_POST['criticName']);
				echo $criticID;
				header('Location: /critic?id=' . $criticID);
			} else {
				$criticError = "<p>The critic could not be added. Please try again later.</p>";
			}
		}
		
		echo "<p>Add data to the website database using the options below.
				You will be redirected after clicking \"Add\".<p>
			<p>To add awards, navigate to the appropriate program pages.</p>
				<form action=\"" . $selfURL . "\" method=\"post\" class=\"inline\">
					<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
					<table class=\"plain\">
						<tr>
							<th width=\"100px\">New Serial</th>
							<td width=\"150px\"><i>Name</i></td>
							<td><input type=\"text\" size=\"20\" name=\"serialName\" required></td>
							<td><button class=\"small-inline\" type=\"submit\" name=\"newSerial\">Add</button></td>
						</tr>
					</table></form>";				
		if (isset($serialError)) {
			echo $serialError;
		}
		
		echo "<form action=\"" . $selfURL . "\" method=\"post\" class=\"inline\">
				<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
				<table class=\"plain\">
					<tr>
						<th width=\"100px\" rowspan=\"4\">New Film</th>
						<td width=\"150px\"><i>Name</i></td>
						<td><input type=\"text\" size=\"20\" name=\"filmName\" required></td>
					</tr>
					<tr>
						<td width=\"150px\"><i>Release Date</i></td>
						<td><input type=\"text\" size=\"20\" name=\"filmReleaseDate\"></td>
					</tr>
					<tr>
						<td width=\"150px\"><i>Runtime</i></td>
						<td><input type=\"text\" size=\"20\" name=\"filmRuntime\"></td>
					</tr>
					<tr>
						<td width=\"150px\"><i>Budget</i></td>
						<td><input type=\"text\" size=\"20\" name=\"filmBudget\"></td>
						<td><button class=\"small-inline\" type=\"submit\" name=\"newFilm\">Add</button></td>
					</tr>
				</table></form>";			
		if (isset($filmError)) {
			echo $filmError;
		}
		
		echo "<form action=\"" . $selfURL . "\" method=\"post\" class=\"inline\">
				<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
				<table class=\"plain\">
					<tr>
						<th width=\"100px\" rowspan=\"3\">New Cast or Crew Member</th>
						<td width=\"150px\"><i>Name</i></td>
						<td><input type=\"text\" size=\"20\" name=\"crewName\" required></td>
					</tr>
					<tr>
						<td width=\"150px\"><i>Birth Date</i></td>
						<td><input type=\"text\" size=\"20\" name=\"crewBD\"></td>
					</tr>
					<tr>
						<td width=\"150px\"><i>Death Date</i></td>
						<td><input type=\"text\" size=\"20\" name=\"crewDD\"></td>
						<td><button class=\"small-inline\" type=\"submit\" name=\"newCrew\">Add</button></td>
					</tr>
				</table></form>";	
		if (isset($crewError)) {
			echo $crewError;
		}
		
		echo "<form action=\"" . $selfURL . "\" method=\"post\" class=\"inline\">
				<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
				<table class=\"plain\">
					<tr>
						<th width=\"100px\" rowspan=\"2\">New Platform</th>
						<td width=\"150px\"><i>Name</i></td>
						<td><input type=\"text\" size=\"20\" name=\"platformName\" required></td>
					</tr>
					<tr>
						<td width=\"150px\"><i>Platform Type</i></td>
						<td>
							<select name=\"isNetwork\" required>
								<option value=\"true\" selected>Television Network</option>
								<option value=\"false\">Streaming Service</option>
							</select>
						</td>
						<td><button class=\"small-inline\" type=\"submit\" name=\"newPlatform\">Add</button></td>
					</tr>
				</table></form>";
		if (isset($platformError)) {
			echo $platformError;
		}
		
		echo "<form action=\"" . $selfURL . "\" method=\"post\" class=\"inline\">
				<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
				<table class=\"plain\">
					<tr>
						<th width=\"100px\">New Publication</th>
						<td width=\"150px\"><i>Name</i></td>
						<td><input type=\"text\" size=\"20\" name=\"publicationName\" required></td>
						<td><button class=\"small-inline\" type=\"submit\" name=\"newPublication\">Add</button></td>
					</tr>
				</table></form>";
		if (isset($publicationError)) {
			echo $publicationError;
		}
		
		$missing = "<span class=\"no-rating\">N/A</span>";
		
		echo "<span id=\"users\" class=\"content-header\"><h3>User Management</h3></span>
				<form class=\"tab\" action=\"" . $selfURL . "#users\" method=\"post\">
					<p>
						<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"1\">Critics</button>
						<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"2\">IP Users</button>
					</p>
				</form>
				<div class=\"content\">";
			
		$currentTab = 1;
		if (isset($_POST['tab'])){
			$currentTab = $_POST['tab'];
		} else {
			$_POST['tab'] = $currentTab;
		}
				
		switch ($currentTab) {
			default:
				$sql = "SELECT C.reviewerID, C.name, C.dbUsername, COUNT(CW.reviewID) AS count
						FROM Critic C
						LEFT JOIN CriticWrites CW
						ON C.reviewerID = CW.reviewerID
						GROUP BY C.reviewerID
						ORDER BY C.name";
				break;
			case 2:
				$sql = "SELECT U.reviewerID, U.ip AS name, COUNT(UR.reviewID) AS count
						FROM User U, UserReview UR
						WHERE U.reviewerID = UR.reviewerID
						GROUP BY U.reviewerID
						ORDER BY U.ip";
				break;
		}
	
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
			echo "<form class=\"tab\" action=\"" . $selfURL . "#users\" method=\"post\">
					<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
					<table align=\"center\" class=\"listing\">";
			
			if ($currentTab == 2) {
				echo "<tr><th>IP</th><th>Review Count</th><th>Manage</th></tr>";
			} else {
				echo "<tr><th>Name</th><th>Review Count</th><th>Publications</th><th>Manage</th></tr>";	
			}
				
			while ($row = $result->fetch_assoc()) {
				$name = $row['name'];
				
				if ($currentTab != 2) {
					$name = "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/critic?id=" . $row['reviewerID'] . "\">" . $name . "</a>";					
				}
				
				echo "<tr><td>" . $name . "</td><td align=\"center\">" . $row['count'] . "</td>";
				
				if ($currentTab != 2) {
					echo "<td align=\"center\">";
					
					$innerSql = "SELECT DISTINCT(P.publicationName)
								FROM Publishes P, CriticWrites CW
								WHERE P.reviewID = CW.reviewID
									AND CW.reviewerID = " . $row['reviewerID'];
					$innerResult = $conn->query($innerSql);
					if ($innerResult->num_rows > 0) {						
						while ($innerRow = $innerResult->fetch_assoc()) {
							$link = "http://" . $_SERVER['HTTP_HOST'] . "/publication?id=" . $innerRow['publicationName'];
							echo "<p><a href=\"" . $link . "\"><i>" . $innerRow['publicationName'] . "</i></a></p>";
						}
					} else {
						echo $missing;
					}
					
					$type = "Critic";
				} else {						
					$type = "IP";
				}
					
				echo "<td align=\"center\">
						<form class=\"tab\" action=\"" . $selfURL . "#users\" method=\"post\">
							<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
							<button class=\"small-inline\" type=\"submit\" name=\"delete" . $type . "\" value=\"" . $row['reviewerID'] . "\">Delete</button>
						</form>
					</td>";
			}
				
			if ($currentTab != 2) {
				echo"<tr>
						<td><input type=\"text\" size=\"20\" name=\"criticName\" required></td>
						<td align=\"center\">" . $missing . "</td>
						<td align=\"center\">" . $missing . "</td>
						<td align=\"center\">
							<button class=\"small-inline\" type=\"submit\" name=\"addCritic\">Add</button>
						</td>
					</tr>";					
			}
			
			echo "</table></form></div>";
			
			if (isset($criticError)) {
				echo $criticError;
			}		
		} else {
			echo "<p>User listing is not available...</p>";
		}
	
		$conn->close();
	}
} else {
	echo "<span class=\"content-header\"><h3>Access Denied</h3></span>
		  <p>You do not have access to this page. Try logging in, or go <a href=\"http://" . $_SERVER['HTTP_HOST'] . "\">home</a>.</p>";
}	
?>
		</div>
		<div class="column-right">
<?php
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
	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<p>Click <a href=\"http://" . $_SERVER['HTTP_HOST'] . "/admin_management\">here</a>
			to add data to the review website database.</p>";		
	}
	
	echo "<form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
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
		unset($_POST["logout"]);
		header('Refresh: 0');
	}
	
	$servername = "localhost:3306";
	$username = htmlspecialchars($_POST['username']);
	$password = htmlspecialchars($_POST['password']);
	$dbname = "untitled_review_website";
	
	echo "<div id=\"login-form\">
		  <span class=\"content-header\"><h3>Login</h3></span>
		  <form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
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
				header('Refresh: 0');
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
		</div>
	</body>
</html>