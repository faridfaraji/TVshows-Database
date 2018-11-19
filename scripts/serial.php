<?php session_start(); ?>
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
	$sql = "SELECT S.name 
			FROM Serial S
			WHERE S.serialID = " . $_GET['id'];
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			if (!empty($row["name"])){
				$_GET['title'] = $row["name"];
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
	echo "<title>" . $_GET['title'] . " | Untitled Review Website</title>";
}

$conn->close();		
?>
			</title>
		<link href="style.css" rel="stylesheet" type="text/css">

		<div id=top>
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

$servername = "localhost:3306";
$username = "application";
$password = "applicationPASSWORD";
$dbname = "untitled_review_website";

$conn = new mysqli($servername, $username, $password, $dbname);

$serialID = $_GET['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $serialID;
	
if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
	$username = $_SESSION['username'];
	$password = $_SESSION['password'];

	$adminConn = new mysqli($servername, $username, $password, $dbname);
}

if (isset($_GET['title']) && !$conn->connect_error) {
	if (isset($_POST['update'])) {	
		if (!isset($adminConn)) {
			$serialError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$sql = "UPDATE Serial
					SET name = \"" . $_POST['update'] . "\"
					WHERE serialID = " . $serialID;
			$adminConn->query($sql);
			unset($_POST['update']);
		}
	} else if (isset($_POST['delete'])) {	
		if (!isset($adminConn)) {
			$serialError = "<p>You are not authorized to perform that action.</p>";
		} else {					
			$sql = "DELETE FROM Program
					WHERE progID IN (SELECT progID 
									FROM Episode 
									WHERE serialID = " . $serialID . ")";
			$adminConn->query($sql);
			
			$sql = "DELETE FROM Serial
					WHERE serialID = " . $serialID;
			$adminConn->query($sql);
			unset($_POST['delete']);
			header('Location: /');
		}
	} else if (isset($_POST['deleteSeason'])) {	
		if (!isset($adminConn)) {
			$seasonError = "<p>You are not authorized to perform that action.</p>";
		} else {					
			$sql = "DELETE FROM Program
					WHERE progID IN (SELECT progID 
									FROM Episode 
									WHERE serialID = " . $serialID . "
									AND seasonID = " . $_POST['deleteSeason'] . ")";
			$adminConn->query($sql);
			
			$sql = "DELETE FROM Season
					WHERE serialID = " . $serialID . "
					AND seasonID = " . $_POST['deleteSeason'];
			$adminConn->query($sql);
			unset($_POST['deleteSeason']);
		}
	} else if (isset($_POST['addSeason'])) {	
		if (!isset($adminConn)) {
			$seasonError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$seasonID = empty($_POST['addSeasonID']) ? "NULL" : $_POST['addSeasonID'];
			$announceDate = empty($_POST['seasonAnnounceDate']) ? "NULL" : $_POST['seasonAnnounceDate'];
			$platform = $_POST['seasonPlatform'];
			
			if ($announceDate != "NULL" && !checkMySQLDate($announceDate)) {
				$seasonError = "<p>Invalid date.</p>";			
			} else {
				if ($announceDate != "NULL") {
					$announceDate = "'" . $announceDate . "'";
				}
				
				$sql = "SELECT platformID
						FROM Platform
						WHERE name = \"" . $platform . "\"";
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0){	
					$row = $result->fetch_assoc();
					$platformID = $row['platformID'];
				} else if (empty($platform)) {
					$platformID = "NULL";
				} else {
					$seasonError = "<p>Platform " . $platform . " does not exist.</p>";					
				}
				
				if (!isset($seasonError)) {					
					$sql = "SELECT seasonID
							FROM Season
							WHERE serialID = " . $serialID . "
								AND seasonID = " . $seasonID;
					$result = $conn->query($sql);
					
					if ($result->num_rows > 0) {
						$seasonError = "<p>This serial can only have one season " . $seasonID . ".</p>";	
					} else {				
						$sql = "INSERT INTO Season (serialID, seasonID, orderingPlatformID, announceDate) VALUES
								(" . $serialID . ", " . $seasonID . ", " . $platformID . ", " . $announceDate . ")";
						$adminConn->query($sql);
						unset($_POST['update']);
						unset($_POST['seasonAnnounceDate']);
						unset($_POST['seasonPlatform']);
					}
				}
			}
		}
	}
	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<form action=\"" . $selfURL . "\" method=\"post\">
				<input type=\"hidden\" name=\"id\" value=\"" . $serialID . "\">";
	}
	
	$title = (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])? 
		("<input type=\"text\" class=\"title\" name=\"title\" size=\"30\" value=\"" . $_GET['title'] . "\">") : 
		$_GET['title'];
	
	echo "<span class=\"content-header\"><h3><i>" . $title . "&nbsp;</i></h3></span>";
	
	
	$missing = "<span class=\"no-rating\">N/A</span>";
	$admin_missing = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "" : $missing;

	echo "<div class=\"wide column-left\">
		<table class=\"plain\">";
			
	$sql = "SELECT MAX(S.seasonID) AS count
			FROM Season S
			WHERE S.serialID = " . $serialID;
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		$numSeasons = $row['count'];
	} else {
		$numSeasons = 0;
	}
	
	echo "<tr><th>Seasons</th><td>" . $numSeasons . "</td></tr>";
			
	$sql = "SELECT COUNT(E.progID) AS count, MIN(P.releaseDate) AS releaseDate
			FROM Program P, Episode E
			WHERE P.progID = E.progID 
				AND E.serialID = " . $serialID . "
			GROUP BY E.serialID";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		$numEps = $row['count'];
		$releaseDate = $row['releaseDate'];
	} else {
		$numEps = 0;
		$releaseDate = $missing;
	}
	echo "<tr><th>Episodes</th><td>" . $numEps . "</td></tr>
			<tr><th>Premiere Date</th><td>" . $releaseDate . "</td></tr>
		</table>";
		
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<button type=\"submit\" name=\"update\">Update</button>
				<button type=\"submit\" name=\"delete\" class=\"right\">Delete</button>
				</form>";
	}
		
	if (isset($serialError)) {
		echo $serialError;
	}
	
	echo "</div>";
		
	$sql = "SELECT AVG(R.rating) AS rating, SUM(R.count) AS count
			FROM (SELECT AVG(R2.rating) AS rating, COUNT(R2.rating) AS count
					FROM Review R2
					WHERE EXISTS(SELECT reviewID
								FROM CriticReview CR
								WHERE CR.reviewID = R2.reviewID)
						AND R2.serialID = " . $serialID . "
					GROUP BY R2.seasonID) R";
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();	
	$criticRating = isset($row['rating']) ? round($row['rating'], 2) : -1;
	$criticCount = empty($row['count']) ? 0 : $row['count'];
	
	$sql = "SELECT AVG(R.rating) AS rating, SUM(R.count) AS count
			FROM Episode E, (SELECT R2.progID, AVG(R2.rating) AS rating, COUNT(R2.rating) AS count
							FROM Review R2
							WHERE EXISTS(SELECT reviewID
										FROM CriticReview CR
										WHERE CR.reviewID = R2.reviewID)
							GROUP BY R2.progID) AS R
			WHERE R.progID = E.progID
				AND E.serialID = " . $serialID;
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();	
	$criticEpRating = isset($row['rating']) ? round($row['rating'], 2) : -1;
	$criticEpCount = empty($row['count']) ? 0 : $row['count'];
	
	$sql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
			FROM Review R, Episode E
			WHERE EXISTS(SELECT reviewID
						FROM UserReview UR
						WHERE UR.reviewID = R.reviewID)
				AND R.progID = E.progID
				AND E.serialID = " . $serialID;
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();	
	$userRating = round($row['rating'], 2);	
	$userCount = empty($row['count']) ? 0 : $row['count'];
	
	echo "<div class=\"wide column-right\">
			<table class=\"plain right centered\" align=\"right\">
				<tr>
					<th><span class=\"rating\">" .
					(($criticRating == -1) ? ($missing . "</span>") : ($criticRating . "</span> %")) .
					"</th>
					<th><span class=\"rating\">" .
					(($criticEpRating == -1) ? ($missing . "</span>") : ($criticEpRating . "</span> %")) .
					"</th>
					<th><span class=\"rating\">" .
					(($userRating == -1) ? ($missing . "</span>") : ($userRating . "</span> %")) .
					"</th>
				</tr>
				<tr>
					<th>Season Critic Rating</th>
					<th>Episode Critic Rating</th>
					<th>Episode User Rating</th>
				</tr>
				<tr>
					<td width=\"150px\">Based on " . $criticCount . " reviews</td>
					<td width=\"150px\">Based on " . $criticEpCount . " reviews</td>
					<td width=\"150px\">Based on " . $userCount . " reviews</td>
				</tr>
			</table>
		</div>
		<p>&nbsp;</p>";
	
	echo "<span id=\"cast\" class=\"content-header\"><h3>Main Cast</h3></span>";
	
	$sql = "SELECT C.crewID, C.name
			FROM Episode E, WorksOn W, CrewPerson C
			WHERE E.progID = W.progID
				AND W.crewID = C.crewID
				AND W.roleID = \"Main cast\"
				AND E.serialID = " . $serialID . "
			GROUP BY C.crewID, C.name";
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) {
		echo "<table class=\"listing\">
				<tr><th>Name</th><th>Credited Roles</th>";
				
		while ($row = $result->fetch_assoc()){
			echo "<tr>
					<td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/crew?id=" . $row['crewID'] . "\">" . $row['name'] . "</a></td>
					<td align=\"center\">";
					
			$crewID = $row['crewID'];	
			$innerSql = "SELECT DISTINCT(W.creditedAs)
						FROM Episode E, WorksOn W
						WHERE E.progID = W.progID
							AND W.crewID = " . $crewID . "
							AND E.serialID = " . $serialID;
			$innerResult = $conn->query($innerSql);
			if ($innerResult->num_rows > 0) {
				while ($innerRow = $innerResult->fetch_assoc()){
					echo "<p>" . $innerRow['creditedAs'] . "</p>";
				}
			} else {
				echo $missing;
			}
			
			echo "</td></tr>";
		}
				
		echo "</table>";
	} else {
		echo "<p>No results available...</p>";		
	}
	
	
	echo "<span id=\"seasons\" class=\"content-header\"><h3>Seasons</h3></span>";
	
	$sql = "SELECT S.seasonID, S.announceDate, P.platformID, P.name
			FROM Season S LEFT JOIN Platform P
			ON S.orderingPlatformID = P.platformID
			WHERE S.serialID = " . $serialID . "
			ORDER BY S.seasonID";
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0 || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) {
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<form action=\"" . $selfURL . "#seasons\" method=\"post\">
					<input type=\"hidden\" name=\"serialID\" value=\"" . $serialID . "\">
					<input type=\"hidden\" name=\"seasonID\" value=\"" . $seasonID . "\">";
		}
		
		echo "<table class=\"listing\">
				<tr>
					<th width=\"30px\">Number</th>
					<th>Episodes</th>
					<th>Premiere Date</th>
					<th>Announce Date</th>
					<th>Platform</th>
					<th>Critic Rating</th>
					<th>User Rating</th>";
				
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<th>Manage</th>";
		}
		
		echo "</tr>";
		
		$seasonIndex = 0;
				
		while ($row = $result->fetch_assoc()){
			$seasonIndex = $row['seasonID'];			
			$announceDate = ((empty($row['announceDate'])) ? $missing : $row['announceDate']);
			
			if (!empty($row['platformID']) && !empty($row['name'])) {
				$platform = "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/platform?id=" . $row['platformID'] . "\">" . $row['name'] . "</a>";
			} else {
				$platform = $missing;
			}
			
			echo "<tr>
					<td align=\"center\">
						<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/season?serialID=" . $serialID . "&seasonID=" . $row['seasonID'] . "\">" . $row['seasonID'] . "</a>
					</td>";
					
			$innerSql = "SELECT COUNT(E.progID) AS count, MIN(P.releaseDate) AS premiereDate
						FROM Program P, Episode E
						WHERE P.progID = E.progID 
							AND E.serialID = " . $serialID . "
							AND E.seasonID = " . $seasonIndex . "
						GROUP BY E.serialID, E.seasonID";
			$innerResult = $conn->query($innerSql);
			
			if ($innerResult->num_rows > 0) {
				$innerRow = $innerResult->fetch_assoc();
				$epCount = $innerRow['count'];
				$premiereDate = ((empty($innerRow['premiereDate'])) ? $missing : $innerRow['premiereDate']);
			} else {
				$epCount = 0;
				$premiereDate = $missing;
			}
					
			echo "<td align=\"center\">" . $epCount . "</td>
					<td align=\"center\">" . $premiereDate . "</td>
					<td align=\"center\">" . $announceDate . "</td>
					<td align=\"center\">" . $platform . "</td>";
					
			$innerSql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
						FROM Review R
						WHERE EXISTS(SELECT reviewID
									FROM CriticReview CR
									WHERE CR.reviewID = R.reviewID)
							AND R.serialID = " . $serialID . "
							AND R.seasonID = " . $seasonIndex;
			$innerResult = $conn->query($innerSql);
			
			if ($innerResult->num_rows > 0) {
				$innerRow = $innerResult->fetch_assoc();
				$criticRating = round($innerRow['rating'], 2) . "%";
			} else {
				$criticRating = '';
			}
				
			echo "<td align=\"center\">" . ((empty($criticRating) || $innerRow['rating'] == 0) ? $missing : $criticRating) . "</td>";	
			
			$innerSql = "SELECT AVG(R.rating) AS rating
						FROM Review R, Episode E
						WHERE EXISTS(SELECT reviewID
									FROM UserReview UR
									WHERE UR.reviewID = R.reviewID)
							AND R.progID = E.progID
							AND E.serialID = " . $serialID . "
							AND E.seasonID = " . $seasonIndex;
			$innerResult = $conn->query($innerSql);
			
			if ($innerResult->num_rows > 0) {
				$innerRow = $innerResult->fetch_assoc();
				$userRating = round($innerRow['rating'], 2) . "%";
			} else {
				$userRating = '';
			}
				
			echo "<td align=\"center\">" . ((empty($userRating) || $innerRow['rating'] == 0) ? $missing : $userRating) . "</td>";		
			
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td align=\"center\">
						<form action=\"" . $selfURL . "#seasons\" method=\"post\" class=\"inline\">
							<button type=\"submit\" name=\"deleteSeason\" class=\"small-inline\" value=\"" . $seasonIndex . "\">Delete</button>
						</form>
					</td>";
			}
			
			echo "</td></tr>";
		}			
			
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<tr>
					<td align=\"center\">
						<input type=\"text\" name=\"addSeasonID\" size=\"2\" required value=\"" . ($seasonIndex + 1) . "\">
					</td>
					<td align=\"center\">" . $missing . "</td>
					<td align=\"center\">" . $missing . "</td>
					<td align=\"center\">
						<input type=\"text\" name=\"seasonAnnounceDate\" size=\"7\" class=\"inline\">
					</td>
					<td align=\"center\">
						<input type=\"text\" name=\"seasonPlatform\" size=\"10\" class=\"inline\">
					</td>
					<td align=\"center\">" . $missing . "</td>
					<td align=\"center\">" . $missing . "</td>
					<td align=\"center\">
						<button type=\"submit\" name=\"addSeason\" class=\"small-inline\">Add</button>
					</td>
				</tr>";
		}
				
		echo "</table>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "</form>";
		}
		
		if (isset($seasonError)) {
			echo $seasonError;
		}
	} else {
		echo "<p>No results available...</p>";		
	}
} else {
	echo "<span class=\"content-header\"><h3>Not Found</h3></span>
			<p>Serial information is not available...</p>"; 
}
?>
		</div>
		<div class="column-right">
<?php
$serialID = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $serialID;

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
			<input type=\"hidden\" name=\"id\" value=\"" . $serialID . "\">
			<button type=\"submit\" name=\"logout\">Logout</button>
		  </form>
		  </div>";
} else {
	if (isset($_POST['logout'])) {
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
			<input type=\"hidden\" name=\"id\" value=\"" . $serialID . "\">
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