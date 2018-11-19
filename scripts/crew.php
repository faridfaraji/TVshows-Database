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
	$sql = "SELECT name FROM CrewPerson WHERE crewID = " . $_GET['id'];
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			if (!empty($row["name"])){
				$_GET['name'] = $row["name"];
			} else {
				$error = true;						
			}
		}
	} else {
		$error = true;
	}
}
if ($error) {
	echo "<title>Page Not Found | Untitled Review Website</title>";
} else {
	echo "<title>" . $_GET['name'] . " | Untitled Review Website</title>";
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

function getCastType($sqlFormatted=true){
	switch ($_POST['tab']) {
		default:
			return $sqlFormatted ? "\"Main cast\"" : "main cast member";
		case 2:
			return $sqlFormatted ? "\"Guest cast\"" : "guest cast member";
		case 3:
			return $sqlFormatted ? "\"Director\"" : "director";
		case 4:
			return $sqlFormatted ? "\"Writer\"" : "writer";
		case 5:
			return $sqlFormatted ? "\"Producer\"" : "producer";
		case 6:
			return $sqlFormatted ? "\"Crew\"" : "crew member";
	}
}

$crewID = $_GET['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $crewID;

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

if (isset($_GET['name']) && !$conn->connect_error && (!isset($adminConn) || !$adminConn->connect_error)) {	
	if (isset($_POST['update'])) {
		if (!isset($adminConn)){
			$crewError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$name = empty($_POST['name']) ? "NULL" : $_POST['name'];
			$birthdate = empty($_POST['birthdate']) ? "NULL" : $_POST['birthdate'];
			$deathdate = empty($_POST['deathdate']) ? "NULL" : $_POST['deathdate'];
			
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
				
				$sql = "UPDATE CrewPerson
						SET name = " . $name . ",
							birthdate = " . $birthdate . ",
							deathdate = " . $deathdate . "
						WHERE crewID = " . $crewID;
				$adminConn->query($sql);
				unset($_POST['update']);
				unset($_POST['name']);
				unset($_POST['birthdate']);
				unset($_POST['deathdate']);
			}
		}
	} else if (isset($_POST['delete'])) {
		if (!isset($adminConn)){
			$crewError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$sql = "DELETE FROM CrewPerson
					WHERE crewID = " . $crewID;
			$adminConn->query($sql);
			unset($_POST['delete']);
			header('Location: /');
		}
	} else if (isset($_POST['updateRole'])) {
		if (!isset($adminConn)){
			$roleError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$progID = $_POST['updateRole'];
			$credit = $_POST['creditedAs' . $progID];
			$roleID = getCastType();

			$sql = "UPDATE WorksOn
					SET creditedAs = \"" . $credit . "\"
					WHERE progID = " . $progID . "
						AND crewID = " . $crewID . "
						AND roleID = " . $roleID;				
			$adminConn->query($sql);
			echo $sql;
			unset($_POST['updateRole']);
			unset($_POST['creditedAs']);
		}
	} else if (isset($_POST['deleteRole'])) {
		if (!isset($adminConn)){
			$roleError = "<p>You are not authorized to perform that action.</p>";
		} else {	
			$progID = $_POST['deleteRole'];	
			$roleID = getCastType();
			
			$sql = "DELETE FROM WorksOn
					WHERE progID = " . $progID . "
						AND crewID = " . $crewID . "
						AND roleID = " . $roleID;	
			$adminConn->query($sql);	
			unset($_POST['deleteCast']);
		}
	}

	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<form action=\"" . $selfURL . "\" method=\"post\">
				<input type=\"hidden\" name=\"id\" value=\"" . $crewID . "\">";
	}
	
	$title = (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])? 
		("<input type=\"text\" class=\"title\" name=\"name\" size=\"30\" value=\"" . $_GET['name'] . "\">") : 
		$_GET['name'];
	
	echo "<span class=\"content-header\"><h3>" . $title . "&nbsp;</h3></span>";	
	
	$missing = "<span class=\"no-rating\">N/A</span>";
	$admin_missing = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "" : $missing;

	echo "<table class=\"plain\">";
			
	$sql = "SELECT C.birthdate, C.deathdate
			FROM CrewPerson C
			WHERE C.crewID = " . $crewID;
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		$birthdate = adP($row['birthdate'], 'birthdate');
		$deathdate = adP($row['deathdate'], 'deathdate');
	} else {
		$numSeasons = $missing;
	}
	
	echo "<tr><th>Birth Date</th><td>" . $birthdate . "</td></tr>";
	
	if ($deathdate != $missing) {
		echo "<tr><th>Death Date</th><td>" . $deathdate . "</td></tr>";
	}
	
	echo "</table>";
		
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<button type=\"submit\" name=\"update\">Update</button>";
		echo"<button type=\"submit\" name=\"delete\" class=\"right\">Delete</button>";
		echo "</form>";
	}
		
	if (isset($crewError)) {
		echo $crewError;
	}
	
	echo "<span id=\"roles\" class=\"content-header\"><h3>Roles</h3></span>
			<p>Here is a list of programs that " . $_GET['name'] . " has worked on.</p>
			<form class=\"tab\" action=\"" . $selfURL . "#roles\" method=\"post\">
				<p>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"1\">Main cast</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"2\">Guest cast</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"3\">Director</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"4\">Writer</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"5\">Producer</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"6\">Other crew</button>
				</p>
			</form>";
		
	$currentTab = 1;
	if (isset($_POST['tab'])){
		$currentTab = $_POST['tab'];
	} else {
		$_POST['tab'] = $currentTab;
	}
			
	switch ($currentTab) {
		default:
			$sql = "SELECT A.programID, A.showName, A.season, A.episode, 
						A.programName, A.releaseDate, W.creditedAs
					FROM WorksOn W, AllReleases A
					WHERE W.progID = A.programID
						AND W.roleID = \"Main cast\"
						AND W.crewID = " . $crewID;	
			break;
		case 2:
			$sql = "SELECT A.programID, A.showName, A.season, A.episode, 
						A.programName, A.releaseDate, W.creditedAs
					FROM WorksOn W, AllReleases A
					WHERE W.progID = A.programID
						AND W.roleID = \"Guest cast\"
						AND W.crewID = " . $crewID;	
			break;
		case 3:
			$sql = "SELECT A.programID, A.showName, A.season, A.episode, 
						A.programName, A.releaseDate, W.creditedAs
					FROM WorksOn W, AllReleases A
					WHERE W.progID = A.programID
						AND W.roleID = \"Director\"
						AND W.crewID = " . $crewID;	
			break;
		case 4:
			$sql = "SELECT A.programID, A.showName, A.season, A.episode, 
						A.programName, A.releaseDate, W.creditedAs
					FROM WorksOn W, AllReleases A
					WHERE W.progID = A.programID
						AND W.roleID = \"Writer\"
						AND W.crewID = " . $crewID;	
			break;
		case 5:
			$sql = "SELECT A.programID, A.showName, A.season, A.episode, 
						A.programName, A.releaseDate, W.creditedAs
					FROM WorksOn W, AllReleases A
					WHERE W.progID = A.programID
						AND W.roleID = \"Producer\"
						AND W.crewID = " . $crewID;	
			break;
		case 6:
			$sql = "SELECT A.programID, A.showName, A.season, A.episode, 
						A.programName, A.releaseDate, W.creditedAs
					FROM WorksOn W, AllReleases A
					WHERE W.progID = A.programID
						AND W.roleID = \"Crew\"
						AND W.crewID = " . $crewID;	
			break;
	}
	
	$result = $conn->query($sql);
			
	if ($result->num_rows > 0) {		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<form action=\"" . $selfURL . "#roles\" method=\"post\">";
		}
		
		echo "<table class=\"listing\">
				<tr><th>Program Name</th><th>Release Date</th><th>Credited Role</th>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<th>Manage</th>";
		}
				
		echo "</tr>";
			
		while ($row = $result->fetch_assoc()) {			
			$link = "http://" . $_SERVER['HTTP_HOST']. "/program?id=" . $row["programID"];
			$showDescriptor = ($row["showName"] === null) ? "" : "<span class=\"show-descriptor\"><i>" . $row["showName"]. "</i>
				S" . $row["season"]. "E" . $row["episode"]. "</span><br/>";
			$showTitle = "<a href=\"" . $link . "\">" . $row["programName"] . "</a>";
		
			echo "<tr>
					<td>" . $showDescriptor. " " . $showTitle. "</td>
					<td align=\"center\">" . $row['releaseDate'] . "</td>
					<td align=\"center\">" . adP($row['creditedAs'], 'creditedAs' . $row['programID']) . "</td>";
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td align=\"center\" width=\"150px\">
						<input type=\"hidden\" name=\"tab\" value=\"" . $_POST['tab'] . "\">
						<button class=\"small-inline\" type=\"submit\" name=\"updateRole\" value=\"" . $row['programID'] . "\">Update</button>
						<button class=\"small-inline\" type=\"submit\" name=\"deleteRole\" value=\"" . $row['programID'] . "\">Delete</button>
					</td>";
			}
		}
		
		echo "</table>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "</form>";
		}
	} else {
		echo "<p>No results available...</p>";
	}
		
	if (isset($roleError)) {
		echo $roleError;
	}
} else {
	echo "<span class=\"content-header\"><h3>Not Found</h3></span>
		<p>Crew information is not available...</p>";
}

$conn->close();
?>
		</div>
		<div class="column-right">
<?php
$criticID = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $criticID;

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
			<input type=\"hidden\" name=\"id\" value=\"" . $criticID . "\">
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
			<input type=\"hidden\" name=\"id\" value=\"" . $criticID . "\">
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