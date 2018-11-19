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
	$sql = "SELECT name FROM Program WHERE progID = " . $_GET['id'];
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
	echo "<title>User Reviews for " . $_GET['name'] . " | Untitled Review Website</title>";
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
$progID = $_GET['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $progID;

$servername = "localhost:3306";
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$dbname = "untitled_review_website";
	  
if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
	echo "<span class=\"content-header\"><h3>User Reviews for " . $_GET['name'] . "</h3></span>";	
		  
	$error = false;
	$conn = new mysqli($servername, $username, $password, $dbname);

	if ($conn->connect_error) {
		$error = true;
	} else {		
		if (isset($_POST['delete'])){
			$sql = "DELETE FROM Review
					WHERE reviewID = " . $_POST['delete'];
			$conn->query($sql);
			unset($_POST['delete']);
		}
	
		$sql = "SELECT R.reviewID, U.ip, R.rating
				FROM User U, Review R, UserReview UR
				WHERE U.reviewerID = UR.reviewerID
					AND R.reviewID = UR.reviewID 
					AND R.progID = " . $_GET['id'] . "
				ORDER BY U.ip";
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
			echo "<p>Here is a list of user reviews for " . $_GET['name'] . ".</p>";
			
			echo "<form action=\"" . $selfURL . "\" method=\"post\">
					<table align=\"center\" class=\"listing\">
						<tr>
							<th>IP</th>
							<th>Rating</th>
							<th>Manage</th>
						</tr>";
			while ($row = $result->fetch_assoc()) {	
				$button = "<button type=\"submit\" name=\"delete\" class=\"small-inline\" 
							value=\"" . $row['reviewID'] . "\">Delete</button>";
			
				echo "<tr class=\"table-entry\">
						<td>" . $row['ip'] . "</td>
						<td align=\"center\">" . $row['rating'] . "%</td>
						<td align=\"center\">" . $button . "</td>
					  </tr>";
			}
			echo "</table>
				</form>";
		} else {
			$error = true;
		}
	}

	if ($error) {
		echo "<p>Review listing is not available...</p>";
	}
} else {
	echo "<span class=\"content-header\"><h3>Access Denied</h3></span>
	  <p>You do not have access to this page. Try logging in, or go <a href=\"http://" . $_SERVER['HTTP_HOST'] . "\">home</a>.</p>";		
}

if (isset($adminConn)){
	$adminConn->close();
}
$conn->close();
?>
		</div>
		<div class="column-right">
<?php
$progID = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $progID;

if (isset($_SESSION['logged_in']) && !isset($_POST['logout'])) {	
	$user_descriptor = "<b>" . $_SESSION['username'] . "</b>";
	
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic'] && $_SESSION['is_critic']) {
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
			
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic'] && $_SESSION['is_critic']) {
		echo "<p>Search for a program to add a review to, or click 
			<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/critic_management\">here</a>
			to view and update your reviews.</p>";
	}
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<p>Click <a href=\"http://" . $_SERVER['HTTP_HOST'] . "/admin_management\">here</a>
			to add data to the review website database.</p>";		
	}
	
	echo "<form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
			<input type=\"hidden\" name=\"id\" value=\"" . $progID . "\">
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
		header('Location: ' . $selfURL);
	}
	
	$servername = "localhost:3306";
	$username = htmlspecialchars($_POST['username']);
	$password = htmlspecialchars($_POST['password']);
	$dbname = "untitled_review_website";
	
	echo "<div id=\"login-form\">
		  <span class=\"content-header\"><h3>Login</h3></span>
		  <form action=\"" . $_SERVER['PHP_SELF'] . "\" method=\"post\">
			<input type=\"hidden\" name=\"id\" value=\"" . $progID . "\">
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