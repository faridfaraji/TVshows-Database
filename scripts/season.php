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
	$sql = "SELECT SE.name 
			FROM Season S, Serial SE 
			WHERE SE.serialID = " . $_GET['serialID'] . "
				AND S.seasonID = " . $_GET['seasonID'] . "
				AND SE.serialID = S.serialID";
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			if (!empty($row["name"])){
				$_GET['title'] = $row["name"] . " Season " . $_GET['seasonID'];
				$_GET['show'] = $row["name"];
				$_GET['season'] = $row["seasonID"];
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

function genSelect($formName, $values, $names, $selected){
	$returnString = "<select name=\"" . $formName . "\">";
	
	for ($i=0; $i < sizeof($values); $i++){
		$selectString = ($values[$i] == $selected) ? "selected" : "";
		$returnString = $returnString . "
			<option value=\"" . $values[$i] . "\" " . $selectString . ">" . $names[$i] . "</option>";
	}
	
	return $returnString . "</select>";
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
$username = "application";
$password = "applicationPASSWORD";
$dbname = "untitled_review_website";

$conn = new mysqli($servername, $username, $password, $dbname);

$serialID = $_GET['serialID'];
$seasonID = $_GET['seasonID'];
$selfURL = $_SERVER['PHP_SELF'] . "?serialID=" . $serialID . "&seasonID=" . $seasonID;
	
if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
	$username = $_SESSION['username'];
	$password = $_SESSION['password'];

	$adminConn = new mysqli($servername, $username, $password, $dbname);
}

if (isset($_GET['title']) && !$conn->connect_error) {	
	if (isset($_POST['update'])) {	
		if (!isset($adminConn)){
			$seasonError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$announceDate = empty($_POST['announceDate']) ? "NULL" : $_POST['announceDate'];
			$platform = empty($_POST['platform']) ? "NULL" : $_POST['platform'];
			$renewed = $_POST['renewed'];
			
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
				
					$sql = "UPDATE Season
							SET announceDate = " . $announceDate . ", 
								orderingPlatformID = " . $platformID . ",
								renewed = " . $renewed . "
							WHERE serialID = " . $serialID . "
								AND seasonID = " . $seasonID;
					$adminConn->query($sql);
					unset($_POST['update']);
					unset($_POST['announceDate']);
					unset($_POST['platform']);
					unset($_POST['renewed']);
				} else {
					$seasonError = "<p>Platform " . $platform . " does not exist.</p>";					
				}
			}
		}
	} else if (isset($_POST['delete'])) {	
		if (!isset($adminConn)){
			$seasonError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$sql = "DELETE FROM Program
					WHERE progID IN (SELECT progID 
									FROM Episode 
									WHERE serialID = " . $serialID . "
									AND seasonID = " . $seasonID . ")";
			$adminConn->query($sql);
			
			$sql = "DELETE FROM Season
					WHERE serialID = " . $serialID . "
						AND seasonID = " . $seasonID;
			$adminConn->query($sql);
			unset($_POST['delete']);
			header('Location: /');
		}
	} else if (isset($_POST['deleteEpisode'])) {	
		if (!isset($adminConn)){
			$epError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$sql = "DELETE FROM Program
					WHERE progID = " . $_POST['deleteEpisode'];
			$adminConn->query($sql);
			unset($_POST['deleteEpisode']);
		}
	} else if (isset($_POST['addEpisode'])) {	
		if (!isset($adminConn)){
			$epError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$epID = empty($_POST['addEpId']) ? "NULL" : $_POST['addEpId'];
			$title = empty($_POST['addEpTitle']) ? "NULL" : $_POST['addEpTitle'];
			$releaseDate = empty($_POST['addEpReleaseDate']) ? "NULL" : $_POST['addEpReleaseDate'];
			$runtime = empty($_POST['addEpRuntime']) ? "NULL" : $_POST['addEpRuntime'];
			
			if ($releaseDate != "NULL" && !checkMySQLDate($releaseDate)) {
				$epError = "<p>Invalid date.</p>";			
			} else if (!isNullOrNumeric($runtime)) {
				$epError = "<p>Runtime must be a nonzero number (in minutes).</p>";
			} else {			
				if ($releaseDate != "NULL") {
					$releaseDate = "'" . $releaseDate . "'";
				}
				$sql = "SELECT epID
						FROM Episode
						WHERE epID = " . $epID . "
							AND serialID = " . $serialID . "
							AND seasonID = " . $seasonID;
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$epError = "<p>This season can only have one episode " . $epID . ".</p>";	
				} else {		
					$sql = "INSERT INTO Program (name, releaseDate, runtime) VALUES
							(\"" . $title . "\", " . $releaseDate . ", " . $runtime . ")";
					$adminConn->query($sql);
					
					$sql = "SELECT LAST_INSERT_ID()";
					$result = $adminConn->query($sql);
					
					if ($result->num_rows > 0) {
						$row = $result->fetch_assoc();
						$progID = $row['LAST_INSERT_ID()'];
						
						$sql = "INSERT INTO Episode (progID, serialID, seasonID, epID) VALUES
										(" . $progID . ", " . $serialID . ", " . $seasonID . ", " . $epID . ");";
						$adminConn->query($sql);
						unset($_POST['addEpisode']);
						unset($_POST['addEpId']);
						unset($_POST['addEpTitle']);
						unset($_POST['addEpReleaseDate']);
						unset($_POST['addEpRuntime']);
						header('Location: /program?id=' . $progID);
					} else {
						$epError = "<p>The episode could not be added. Please try again later.</p>";
					}
				}
			}
		}
	}
	
	$showLink = "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/serial?id=" . $serialID . "\"><i>" . $_GET['show'] . "</i></a>";
	
	echo "<span class=\"padded-content-header\"><h3>Season " . $seasonID . "</h3></span>
			<span class=\"info-header\">" . $showLink;
			
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
		echo "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/add_review?serialID=" . $serialID . "&seasonID=" . $seasonID . "\">
				<input type=\"button\" class=\"right inline\" value=\"Add Review\">
			  </a>";
	} 
			
	echo "</span>";
		
	$missing = "<span class=\"no-rating\">N/A</span>";
	$admin_missing = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "" : $missing;

	echo "<div class=\"wide column-left\">";
	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<form action=\"" . $selfURL . "\" method=\"post\">
				<input type=\"hidden\" name=\"serialID\" value=\"" . $serialID . "\">
				<input type=\"hidden\" name=\"seasonID\" value=\"" . $seasonID . "\">";
	}
	
	echo "<table class=\"plain\">";
			
	$sql = "SELECT COUNT(E.progID) AS count, MIN(P.releaseDate) AS premiereDate
			FROM Program P, Episode E
			WHERE P.progID = E.progID 
				AND E.serialID = " . $serialID . "
				AND E.seasonID = " . $seasonID . "
			GROUP BY E.serialID, E.seasonID";
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		$numEps = $row['count'];
		$premiereDate = $row['premiereDate'];
	} else {
		$numEps = 0;
		$premiereDate = $missing;
	}
	echo "<tr><th>Episodes</th><td>" . $numEps . "</td></tr>
			<tr><th>Premiere Date</th><td>" . $premiereDate . "</td></tr>";
			
	$sql = "SELECT S.announceDate, P.platformID, P.name, IF(ISNULL(S.renewed), -1, S.renewed) AS renewed
			FROM Season S, Platform P
			WHERE S.orderingPlatformID = P.platformID 
				AND S.serialID = " . $serialID . "
				AND S.seasonID = " . $seasonID;
	$result = $conn->query($sql);
	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		$announceDate = adP($row['announceDate'], 'announceDate');
		$platformID = $row['platformID'];
		$rawPlatform = $row['name'];
		$platform = adP($row['name'], 'platform');
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
			$curRenewed = ($row['renewed'] == -1) ? "NULL" : ($row['renewed'] ? "TRUE" : "FALSE");
			$renewed = genSelect('renewed', ['TRUE', 'FALSE', 'NULL'], ['Renewed', 'Cancelled', 'Undecided'], $curRenewed);			
		} else {
			$renewed = ($row['renewed'] == -1) ? "Undecided" : ($row['renewed'] ? "Renewed" : "Cancelled");
		}
	} else {
		$announceDate = adP($admin_missing, 'announceDate');
		$platform = $adP($admin_missing, 'platform');
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
			$renewed = genSelect('renewed', ['TRUE', 'FALSE', 'NULL'], ['Renewed', 'Cancelled', 'Undecided'], 'NULL');
		} else {
			$renewed = "Undecided";
		}
	}
	
	if ($platform != $admin_missing && $platform == $rawPlatform){
		$platform = "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/platform?id=" . $platformID . "\">" . $platform . "</a>";
	}
	
	echo "<tr><th>Announcement Date</th><td>" . $announceDate . "</td></tr>
			<tr><th>Ordering Platform</th><td>" . $platform . "</td></tr>
			<tr><th>Renewal Status</th><td>" . $renewed . "</td></tr>
		</table>";
		
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<button type=\"submit\" name=\"update\">Update</button>
				<button type=\"submit\" name=\"delete\" class=\"right\">Delete</button>
				</form>";
	}
		
	if (isset($seasonError)) {
		echo $seasonError;
	}
	
	echo "</div>";
		
	$sql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
			FROM Review R
			WHERE EXISTS(SELECT reviewID
						FROM CriticReview CR
						WHERE CR.reviewID = R.reviewID)
				AND R.serialID = " . $serialID . "
				AND R.seasonID = " . $seasonID;
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
				AND E.serialID = " . $serialID . "
				AND E.seasonID = " . $seasonID;
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
				AND E.serialID = " . $serialID . "
				AND E.seasonID = " . $seasonID;
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
		</div>";
	
	echo "<p>&nbsp;</p>
		<span id=\"cast\" class=\"content-header\"><h3>Main Cast</h3></span>";
	
	$sql = "SELECT C.crewID, C.name
			FROM Episode E, WorksOn W, CrewPerson C
			WHERE E.progID = W.progID
				AND W.crewID = C.crewID
				AND W.roleID = \"Main cast\"
				AND E.serialID = " . $serialID . "
				AND E.seasonID = " . $seasonID . "
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
							AND E.serialID = " . $serialID . "
							AND E.seasonID = " . $seasonID;
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
	
	echo "<span id=\"episodes\" class=\"content-header\"><h3>Episodes</h3></span>";
	
	$sql = "SELECT E.epID, P.progID, P.name, P.releaseDate, P.runtime
			FROM Program P, Episode E
			WHERE P.progID = E.progID
				AND E.serialID = " . $serialID . "
				AND E.seasonID = " . $seasonID;
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0 || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) {
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<form action=\"" . $selfURL . "#episodes\" method=\"post\">
					<input type=\"hidden\" name=\"serialID\" value=\"" . $serialID . "\">
					<input type=\"hidden\" name=\"seasonID\" value=\"" . $seasonID . "\">";
		}
		
		echo "<table class=\"listing\">
				<tr><th width=\"30px\">Number</th><th>Title</th><th>Release Date</th><th>Runtime</th><th>Critic Rating</th><th>User Rating</th>";
				
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<th>Manage</th>";
		}
		
		echo "</tr>";
		
		$epIndex = 0;
				
		while ($row = $result->fetch_assoc()){
			$epIndex = $row['epID'];
			
			echo "<tr>
					<td width=\"30px\" align=\"center\">" . $row['epID'] . "</td>
					<td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/program?id=" . $row['progID'] . "\">" . $row['name'] . "</a></td>
					<td align=\"center\">" . ((empty($row['releaseDate'])) ? $missing : $row['releaseDate']) . "</td>
					<td align=\"center\">" . ((empty($row['runtime'])) ? $missing : ($row['runtime'] . " mins")) . "</td>";
					
			$innerSql = "SELECT currentCriticRating, currentUserRating
						FROM AllReleases
						WHERE programID = " . $row['progID'];
			$innerResult = $conn->query($innerSql);
			
			if ($innerResult->num_rows > 0) {
				$innerRow = $innerResult->fetch_assoc();
				$criticRating = round($innerRow['currentCriticRating'], 2) . "%";
				$userRating = round($innerRow['currentUserRating'], 2) . "%";
			} else {
				$criticRating = '';
				$userRating = '';
			}
				
			echo "<td align=\"center\">" . ((empty($criticRating) || $innerRow['currentCriticRating'] == 0) ? $missing : $criticRating) . "</td>";
			echo "<td align=\"center\">" . ((empty($userRating) || $innerRow['currentUserRating'] == 0) ? $missing : $userRating) . "</td>";
			
			
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td align=\"center\">
						<form action=\"" . $selfURL . "#episodes\" method=\"post\" class=\"inline\">
							<button type=\"submit\" name=\"deleteEpisode\" class=\"small-inline\" value=\"" . $row['progID'] . "\">Delete</button>
						</form>
					</td>";
			}
			
			echo "</td></tr>";
		}
			
			
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<tr>
					<td width=\"30px\" align=\"center\">
						<input type=\"text\" name=\"addEpId\" size=\"2\" required value=\"" . ($epIndex + 1) . "\">
					</td>
					<td width=\"30px\" align=\"center\">
						<input type=\"text\" name=\"addEpTitle\" required>
					</td>
					<td width=\"30px\" align=\"center\">
						<input type=\"text\" name=\"addEpReleaseDate\" size=\"7\">
					</td>
					<td width=\"30px\" align=\"center\">
						<input type=\"text\" name=\"addEpMins\" size=\"1\" class=\"inline\"> mins
					</td>
					<td width=\"30px\" align=\"center\">" . $missing . "</td>
					<td width=\"30px\" align=\"center\">" . $missing . "</td>
					<td align=\"center\">
						<button type=\"submit\" name=\"addEpisode\" class=\"small-inline\">Add</button>
					</td>
				</tr>";
		}
				
		echo "</table>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "</form>";
		}
		
		if (isset($epError)) {
			echo $epError;
		}
	} else {
		echo "<p>No results available...</p>";		
	}
	
	echo "<span id=\"reviews\" class=\"content-header\"><h3>Reviews</h3></span>";
			
	$sql = "SELECT R.reviewID, R.rating, CR.title, CR.textExcerpt
			FROM Review R 
			JOIN CriticReview CR ON R.reviewID = CR.reviewID 
			WHERE R.serialID = " . $serialID . "
				AND R.seasonID = " . $seasonID . "
			ORDER BY R.reviewID";
	
	$result = $conn->query($sql);
			
	if ($result->num_rows > 0) {
		echo "<table class=\"listing\">
			<tr>
				<th>Authors</th>
				<th>Title</th>
				<th>Publications</th>
				<th>Rating</th>
			</tr>";
		
		while ($row = $result->fetch_assoc()) {
			echo "<tr><td>";	
			
			$reviewID = $row['reviewID'];
			$title = $row['title'];
			$rating = $row['rating'] . "%";
			$textExcerpt = (empty($textExcerpt)) ? $missing : $row['textExcerpt'];
			
			$authorSql = "SELECT C.reviewerID, C.name
							FROM Critic C, CriticWrites CW
							WHERE C.reviewerID = CW.reviewerID
								AND CW.reviewID = " . $reviewID;
			$authorResult = $conn->query($authorSql);
			
			while ($innerRow = $authorResult->fetch_assoc()) {
				echo "<p><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/critic?id=" . $innerRow['reviewerID'] . "\">
					" . $innerRow['name'] . "</a></p>";
			}
					
			echo "</td>
					<td style=\"width:250px\">" . $title . "</td>
					<td align=\"center\">";
			
			$pubSql = "SELECT publicationName
							FROM Publishes
							WHERE reviewID = " . $reviewID;
			$pubResult = $conn->query($pubSql);
			
			while ($innerRow = $pubResult->fetch_assoc()) {
				echo "<p><i><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/publication?id=" . $innerRow['publicationName'] . "\">
					" . $innerRow['publicationName'] . "</a></i></p>";
			}
			
			echo "</td>
						<td align=\"center\">" . $rating . "</td>
					</tr>
					<tr>
						<td colspan=\"4\"><p>" . $textExcerpt . "</p></td>
					</tr>";
		}
	} else {
		echo "<p>No results available...</p>";			
	}
	
	$conn->close();
 } else {
	echo "<span class=\"content-header\"><h3>Not Found</h3></span>
		<p>Season information is not available...</p>"; 
 }
?>
				</table>
			</div>
		</div>
		<div class="column-right">
<?php
$serialID = isset($_GET['serialID']) ? $_GET['serialID'] : $_POST['serialID'];
$seasonID = isset($_GET['seasonID']) ? $_GET['seasonID'] : $_POST['seasonID'];
$selfURL = $_SERVER['PHP_SELF'] . "?serialID=" . $serialID . "&seasonID=" . $seasonID;

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
			<input type=\"hidden\" name=\"serialID\" value=\"" . $serialID . "\">
			<input type=\"hidden\" name=\"seasonID\" value=\"" . $seasonID . "\">
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
			<input type=\"hidden\" name=\"serialID\" value=\"" . $serialID . "\">
			<input type=\"hidden\" name=\"seasonID\" value=\"" . $seasonID . "\">
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