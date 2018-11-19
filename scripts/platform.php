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
	$sql = "SELECT P.name, P.isNetwork
			FROM Platform P
			WHERE P.platformID = " . $_GET['id'];
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			if (!empty($row["name"])){
				$_GET['title'] = $row["name"];
				$_GET['isNetwork'] = $row["isNetwork"];
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
function adP($rawHTML, $key, $required=false, $size=20){
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
		if ($required){
			return "<input type=\"text\" size=\"" . $size . "\" name=\"" . $key . "\" required value=\"" . $rawHTML . "\">";
		} else {
			return "<input type=\"text\" size=\"" . $size . "\" name=\"" . $key . "\" value=\"" . $rawHTML . "\">";			
		}
	} else {
		return $rawHTML;
	}
}

function checkMySQLDate($dateString){
	$dateComponents = explode("-", $dateString);
	if (count($dateComponents) != 3 || !checkDate(intval($dateComponents[1]), intval($dateComponents[2]), intval($dateComponents[0]))) {
		return false;
	}
	return true;
}

function checkMySQLTime($timeString){
	return preg_match("/^(?:2[0-3]|[01][0-9]):[0-5][0-9]:[0-5][0-9]$/", $timeString);
}

function isNullOrNumeric($string, $checkPercent=false){
	if ($string == "NULL"){
		return true;
	} else {
		return ((is_numeric($string) && floatval($string) > 0) && 
		(!$checkPercent || floatval($string) <= 100));
	}
}

$servername = "localhost:3306";
$username = "application";
$password = "applicationPASSWORD";
$dbname = "untitled_review_website";

$conn = new mysqli($servername, $username, $password, $dbname);

$platformID = $_GET['id'];
$isNetwork = $_GET['isNetwork'];
$networkType = $isNetwork ? "Television Network" : "Streaming Service";
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $platformID;
	
if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
	$username = $_SESSION['username'];
	$password = $_SESSION['password'];

	$adminConn = new mysqli($servername, $username, $password, $dbname);
}

if (isset($_GET['title']) && isset($_GET['isNetwork']) && !$conn->connect_error) {
	if (isset($_POST['update'])) {	
		if (!isset($adminConn)) {
			$platformError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$platformTitle = $_POST['title'];
			
			$_GET['title'] = $platformTitle;
			
			$sql = "UPDATE Platform
					SET name = \"" . $platformTitle . "\"
					WHERE platformID = " . $platformID;
			$adminConn->query($sql);
			unset($_POST['update']);
		}
	} else if (isset($_POST['delete'])) {	
		if (!isset($adminConn)) {
			$platformError = "<p>You are not authorized to perform that action.</p>";
		} else {						
			$sql = "DELETE FROM Platform
					WHERE platformID = " . $platformID;
			$adminConn->query($sql);
			unset($_POST['delete']);
			header('Location: /');
		}
	} else if (isset($_POST['deleteSeason'])) {	
		if (!isset($adminConn)) {
			$seasonError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$exploded = explode('&^', $_POST['deleteSeason']);
			
			$serialID = $exploded[0];
			$seasonID = $exploded[1];
			
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
			
			unset($_POST['deleteSeason']);
		}
	} else if (isset($_POST['deleteEpisode'])) {
		if (!isset($adminConn)){
			$episodeError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$progID = $_POST['deleteEpisode'];
		
			switch ($isNetwork) {					
				default:
					$date = $_POST['updateOldDate' . $progID];
					$time = $_POST['updateOldTime' . $progID];
					
					$sql = "DELETE FROM Broadcast
							WHERE progID = " . $progID . "
								AND platformID = " . $platformID . "
								AND date = '" . $date . "'
								AND time = '" . $time . "'";
					$adminConn->query($sql);
					break;
				case 2:
					$date = $_POST['updateOldDate' . $progID];
					
					$sql = "DELETE FROM Stream
								WHERE progID = " . $progID . "
									AND platformID = " . $platformID . "
									AND releaseDate = '" . $date . "'";
					$adminConn->query($sql);
					break;
			}
			
			unset($_POST['deletePlatform']);
		}
	} else if (isset($_POST['updateEpisode'])) {	
		if (!isset($adminConn)){
			$episodeError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$progID = $_POST['updateEpisode'];
			$oldDate = $_POST['updateOldDate' . $progID];
			$oldTime = $_POST['updateOldTime' . $progID];
			$date = empty($_POST['updateDate' . $progID]) ? "NULL" : $_POST['updateDate' . $progID];
			$time = empty($_POST['updateTime' . $progID]) ? "NULL" : $_POST['updateTime' . $progID];
			$dayOfViewers = empty($_POST['updateLiveViewers' . $progID]) ? "NULL" : $_POST['updateLiveViewers' . $progID];
			$dayOfShare = empty($_POST['updateLiveShare' . $progID]) ? "NULL" : $_POST['updateLiveShare' . $progID];
			$livePlusThree = empty($_POST['updatePlusThree' . $progID]) ? "NULL" : $_POST['updatePlusThree' . $progID];
			$livePlusSeven = empty($_POST['updatePlusSeven' . $progID]) ? "NULL" : $_POST['updatePlusSeven' . $progID];
			
			if (!isNullOrNumeric($dayOfViewers)) {
				$platformError = "<p>Viewership must be a nonzero number (in millions).</p>";
			} else if (!isNullOrNumeric($dayOfShare, true) || 
						!isNullOrNumeric($livePlusThree, true) || 
						!isNullOrNumeric($livePlusSeven, true)) {
				$platformError = "<p>Viewer share must be a nonzero percentage.</p>";	
			} else if ($date == "NULL" || !checkMySQLDate($date)) {
				$platformError = "<p>Invalid date.</p>";			
			} else if ($isNetwork && ($time == "NULL" || !checkMySQLTime($time))) {
				$platformError = "<p>Invalid time.</p>";		
			} else {
				$date = "'" . $date . "'";
				if ($time != "NULL") {
					$time = "'" . $time . "'";
				}
				
				if ($isNetwork) {
					$sql = "SELECT date, time
							FROM BroadcastSchedule
							WHERE platformID = " . $platformID . "
								AND date = " . $date . "
								AND time = " . $time;
								
					$result = $conn->query($sql);
					if (!($result->num_rows > 0)) {
						$sql = "INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
								(" . $platformID . ", " . $date . ", " . $time . ")";									
						$adminConn->query($sql);
					}
					
					$sql = "SELECT date, time
							FROM Broadcast
							WHERE platformID = " . $platformID . "
								AND date = '" . $oldDate . "'
								AND time = '" . $oldTime . "'
								AND progID = " . $progID;		
								
					$result = $conn->query($sql);
					
					if ($result->num_rows > 0) {	
						$sql = "UPDATE Broadcast
								SET dayOfViewers = " . $dayOfViewers . ",
									dayOfShare = " . $dayOfShare . ",
									livePlusThree = " . $livePlusThree . ",
									livePlusSeven = " . $livePlusSeven . ",
									date = " . $date . ",
									time = " . $time . "
								WHERE platformID = " . $platformID . "
									AND date = '" . $oldDate . "'
									AND time = '" . $oldTime . "'
									AND progID = " . $progID;
					} else {
						$sql = "INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, 
									dayOfShare, livePlusThree, livePlusSeven) VALUES
								(" . $platformID . ", " . $date . ", " . $time . ", " . $progID . ", " . 
								$dayOfViewers . ", " . $dayOfShare . ", " . $livePlusThree . ", " . $livePlusSeven . ")";	
					}
					
					$adminConn->query($sql);
				} else {		
					$sql = "SELECT releaseDate
							FROM Stream
							WHERE platformID = " . $platformID . "
								AND progID = " . $progID;	
								
					$result = $conn->query($sql);
					
					if ($result->num_rows > 0) {				
						$sql = "UPDATE Stream
								SET releaseDate = " . $date . "
								WHERE platformID = " . $platformID . "
									AND progID = " . $progID;
					} else {						
						$sql = "INSERT INTO Stream (platformID, progID, releaseDate) VALUES
								(" . $platformID . ", '" . $progID . ", " . $date . ")";	
					}
									
					$adminConn->query($sql);
				}			
						
				unset($_POST['updateEpisode']);
				unset($_POST['updateDate']);
				unset($_POST['updateTime']);
				unset($_POST['updateLiveViewers']);
				unset($_POST['updateLiveShare']);
				unset($_POST['updateLivePlusThree']);
				unset($_POST['updateLivePlusSeven']);
			}
		}
	}
	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<form action=\"" . $selfURL . "\" method=\"post\">
				<input type=\"hidden\" name=\"id\" value=\"" . $platformID . "\">";
	}
	
	$title = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
		("<input type=\"text\" class=\"title\" name=\"title\" size=\"30\" value=\"" . $_GET['title'] . "\" required>") : 
		$_GET['title'];	
		
	echo "<span class=\"padded-content-header\"><h3><i>" . $title . "&nbsp;</i></h3></span>
			<span class=\"info-header\">" . $networkType;
		
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<button type=\"submit\" name=\"delete\" class=\"inline right\">Delete</button>
				<button type=\"submit\" name=\"update\" class=\"inline right\">Update</button>
			</span></form>";
	}
	
	echo "</span>";
	
	if (isset($platformError)){
		echo $platformError;
	}
	
	if ($isNetwork) {
		$missing = "<span class=\"no-rating\">N/A</span>";
	
		echo "<span id=\"ratings\" class=\"content-header\"><h3>Ratings at a Glance</h3></span>
			<form class=\"tab\" action=\"" . $selfURL . "#ratings\" method=\"post\">
				<p>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"1\">Live Viewers</button>
					<button class=\"tab\" type=\"submit\" name=\"tab\" value=\"2\">Live/DVR Share</button>
				</p>
			</form>";
		
		$currentTab = 1;
		if (isset($_POST['tab'])){
			$currentTab = $_POST['tab'];
		} else {
			$_POST['tab'] = $currentTab;
		}
	
		$sql = "SELECT DISTINCT(time) AS time
				FROM Broadcast
				WHERE platformID = " . $platformID . "
				ORDER BY time ASC";
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
			echo "<table class=\"listing\">
					<tr>
						<th width=\"100px\">" . ($currentTab == 2 ? "Live/+3/+7" : "Millions") . "</th>
						<th>Sunday</th>
						<th>Monday</th>
						<th>Tuesday</th>
						<th>Wednesday</th>
						<th>Thursday</th>
						<th>Friday</th>
						<th>Saturday</th>
					</tr>";
					
			while ($row = $result->fetch_assoc()) {
				$time = $row['time'];
				echo "<tr style=\"background-color:#e0f5ff;\">
						<th>" . $time . "</th>";
						
				for ($i = 1; $i <= 7; $i++){
					switch ($currentTab) {
						default:
							$innerSql = "SELECT AVG(dayOfViewers) AS avg
										FROM Broadcast
										WHERE platformID = " . $platformID . "
											AND time='" . $time . "'
											AND DAYOFWEEK(date) = " . $i;
							$innerResult = $conn->query($innerSql);
							
							if ($innerResult->num_rows > 0) {
								$innerRow = $innerResult->fetch_assoc();
								
								if ($innerRow['avg'] == 0) {
									echo "<td align=\"center\">" . $missing . "</td>";										
								} else {
									echo "<td align=\"center\">" . round($innerRow['avg'], 2) . "</td>";									
								}			
							} else {
								echo "<td align=\"center\">" . $missing . "</td>";		
							}							
							break;
						case 2:
							$innerSql = "SELECT AVG(dayOfShare) AS live, AVG(livePlusThree) AS three, 
												AVG(livePlusSeven) AS seven
										FROM Broadcast
										WHERE platformID = " . $platformID . "
											AND time='" . $time . "'
											AND DAYOFWEEK(date) = " . $i;
							$innerResult = $conn->query($innerSql);
							
							if ($innerResult->num_rows > 0) {
								$innerRow = $innerResult->fetch_assoc();
								
								if ($innerRow['live'] == 0 &&
									$innerRow['three'] == 0 &&
									$innerRow['seven'] == 0) {
									echo "<td align=\"center\">" . $missing . "</td>";										
								} else {
									$live = round($innerRow['live'], 2);
									$three = round($innerRow['three'], 2);
									$seven = round($innerRow['seven'], 2);
									
									echo "<td align=\"center\">" . $live . "/" . $three . "/" . $seven . "</td>";									
								}									
							} else {
								echo "<td align=\"center\">" . $missing . "</td>";		
							}
							break;
					}
				}
				
				echo "</tr>";
			}
			
			echo "</table>";
		} else {
			echo "<p>Data deficient...</p>";
		}
	}
	
	echo "<span id=\"seasons\" class=\"content-header\"><h3>Ordered Seasons</h3></span>";
		
	$missing = "<span class=\"no-rating\">N/A</span>";
	$adminMissing = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "" : $missing;
	
	$sql = "SELECT SE.serialID, SE.name, S.seasonID, S.announceDate, S.renewed
			FROM Serial SE, Season S
			WHERE SE.serialID = S.serialID
				AND S.orderingPlatformID = " . $platformID . "
			ORDER BY S.announceDate DESC, SE.serialID ASC";
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) {
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<form action=\"" . $selfURL . "#seasons\" method=\"post\">
					<input type=\"hidden\" name=\"platformID\" value=\"" . $platformID . "\">";
		}
		
		echo "<table class=\"listing\">
				<tr>
					<th>Serial Name</th>
					<th width=\"30px\">Season</th>
					<th>Announce Date</th>
					<th>Renewal Status</th>
					<th>Critic Rating</th>
					<th>User Rating</th>";
				
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<th>Manage</th>";
		}
		
		echo "</tr>";
				
		while ($row = $result->fetch_assoc()){
			$serialID = $row['serialID'];	
			$seasonID = $row['seasonID'];	
			$renewed = $row['renewed'];			
			$announceDate = ((empty($row['announceDate'])) ? $missing : $row['announceDate']);
			
			echo "<tr>
					<td>
						<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/serial?id=" . $serialID . "\"><i>" . $row['name'] . "</i></a>
					</td>
					<td align=\"center\">
						<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/season?serialID=" . $serialID . "&seasonID=" . $seasonID . "\">" . $seasonID . "</a>
					</td>
					<td align=\"center\">" . $announceDate . "</td>";
					
			if ($renewed == NULL){
				echo "<td align=\"center\" class=\"pending\">Undecided</td>";
			} else if ($renewed) {
				echo "<td align=\"center\" class=\"won\">Renewed</td>";				
			} else {
				echo "<td align=\"center\" class=\"nominated\">Cancelled</td>";
				
			}
					
			$innerSql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
						FROM Review R
						WHERE EXISTS(SELECT reviewID
									FROM CriticReview CR
									WHERE CR.reviewID = R.reviewID)
							AND R.serialID = " . $serialID . "
							AND R.seasonID = " . $seasonID;
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
							AND E.seasonID = " . $seasonID;
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
							<button type=\"submit\" name=\"deleteSeason\" class=\"small-inline\" value=\"" . $serialID . "&^" . $seasonID . "\">Delete</button>
						</form>
					</td>";
			}
			
			echo "</td></tr>";
		}			
		
		echo "</table>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "</form>";
		}
		
		if (isset($seasonError)){
			echo $seasonError;
		}
		
	} else {
		echo "<p>No results available...</p>";		
	}
	
	echo "<span id=\"episodes\" class=\"content-header\"><h3>Released Episodes</h3></span>";
	
	if ($_GET['isNetwork']) {
		$sql = "SELECT A.programID, A.showName, A.season, A.episode, A.programName, 
					B.date, B.time, B.dayOfViewers, B.dayOfShare, B.livePlusThree, B.livePlusSeven
				FROM AllReleases A, Broadcast B
				WHERE A.programID = B.progID
					AND B.platformID = " . $platformID . "
				ORDER BY B.date DESC, B.time DESC, A.programID ASC";
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<form action=\"" . $selfURL . "#episodes\" method=\"post\">
						<input type=\"hidden\" name=\"platformID\" value=\"" . $platformID . "\">";
			}
			
			echo "<form action=\"" . $selfURL . "#episodes\" method=\"post\" class=\"inline\">
					<table class=\"listing\">
					<tr>
						<th>Program Name</th>
						<th>Date</th>
						<th>Live Viewers</th>
						<th>Live Share</th>
						<th>Live+3 Share</th>
						<th>Live+7 Share</th>";
					
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<th>Manage</th>";
			}
			
			echo "</tr>";
					
			while ($row = $result->fetch_assoc()){
				$progID = $row["programID"];
				$link = "http://" . $_SERVER['HTTP_HOST']. "/program?id=" . $progID;
				$showDescriptor = ($row["showName"] === null) ? "" : "<span class=\"show-descriptor\"><i>" . $row["showName"]. "</i>
					S" . $row["season"]. "E" . $row["episode"]. "</span><br/>";
				$showTitle = "<a href=\"" . $link . "\">" . $row["programName"] . "</a>";
				$dayOfViewers = (empty($row['dayOfViewers'])) ? $adminMissing : $row['dayOfViewers'];
				$dayOfShare = (empty($row['dayOfShare'])) ? $adminMissing : $row['dayOfShare'];
				$livePlusThree = (empty($row['livePlusThree'])) ? $adminMissing : $row['livePlusThree'];
				$livePlusSeven = (empty($row['livePlusSeven'])) ? $adminMissing : $row['livePlusSeven'];
				
				echo "<tr class=\"table-entry\">
						<td>" . $showDescriptor. "" . $showTitle. "</td>
						<input type=\"hidden\" name=\"updateOldDate" . $progID . "\" value=\"" . $row['date'] . "\">
						<input type=\"hidden\" name=\"updateOldTime" . $progID . "\" value=\"" . $row['time'] . "\">
						<td align=\"center\">". adP($row['date'], 'updateDate' . $progID, false, 7) . " " . adP($row['time'], 'updateTime' . $progID, false, 5) . "</td>
						<td align=\"center\">" . adP($dayOfViewers, 'updateLiveViewers' . $progID, false, 5) . "</td>
						<td align=\"center\">" . adP($dayOfShare, 'updateLiveShare' . $progID, false, 5) . "</td>
						<td align=\"center\">" . adP($livePlusThree, 'updatePlusThree' . $progID, false, 5) . "</td>
						<td align=\"center\">" . adP($livePlusSeven, 'updatePlusSeven' . $progID, false, 5) . "</td>";	
			
				if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
					echo "<td align=\"center\">
								<button type=\"submit\" name=\"updateEpisode\" class=\"small-inline\" value=\"" . $progID . "\">Update</button>
								<button type=\"submit\" name=\"deleteEpisode\" class=\"small-inline\" value=\"" . $progID . "\">Delete Airing</button>
						</td>";
				}		

				echo "</tr>";
			}		
			
			echo "</table>
				</form>";
			
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "</form>";
			}
			
		} else {
			echo "<p>No results available...</p>";		
		}
	} else {
		$sql = "SELECT A.programID, A.showName, A.season, A.episode, A.programName, S.releaseDate AS date
				FROM AllReleases A, Stream S
				WHERE A.programID = S.progID
					AND S.platformID = " . $platformID . "
				ORDER BY S.releaseDate DESC, A.programID ASC";
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<form action=\"" . $selfURL . "#episodes\" method=\"post\">
						<input type=\"hidden\" name=\"platformID\" value=\"" . $platformID . "\">";
			}
			
			echo "<form action=\"" . $selfURL . "#episodes\" method=\"post\" class=\"inline\">
					<table class=\"listing\">
					<tr>
						<th>Program Name</th>
						<th>Date</th>";
					
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<th>Manage</th>";
			}
			
			echo "</tr>";
					
			while ($row = $result->fetch_assoc()){
				$link = "http://" . $_SERVER['HTTP_HOST']. "/program?id=" . $row["programID"];
				$showDescriptor = ($row["showName"] === null) ? "" : "<span class=\"show-descriptor\"><i>" . $row["showName"]. "</i>
					S" . $row["season"]. "E" . $row["episode"]. "</span><br/>";
				$showTitle = "<a href=\"" . $link . "\">" . $row["programName"] . "</a>";
				
				echo "<tr class=\"table-entry\">
						<td>" . $showDescriptor. "" . $showTitle. "</td>
						<input type=\"hidden\" name=\"updateOldDate\" value=\"" . $row['date'] . "\">
						<td align=\"center\">". adP($row['date'], 'updateDate' . $progID, false, 7) . "</td>";
			
				if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
					echo "<td align=\"center\">
								<button type=\"submit\" name=\"updateEpisode\" class=\"small-inline\" value=\"" . $progID . "\">Update</button>
								<button type=\"submit\" name=\"deleteEpisode\" class=\"small-inline\" value=\"" . $progID . "\">Delete Airing</button>
						</td>";
				}		

				echo "</tr>";
			}		
			
			echo "</table>
				</form>";
			
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "</form>";
			}
			
		} else {
			echo "<p>No results available...</p>";		
		}
		
		if (isset($episodeError)){
			echo $episodeError;
		}
	}
} else {
	echo "<span class=\"content-header\"><h3>Not Found</h3></span>
			<p>Network information is not available...</p>"; 
}
?>
		</div>
		<div class="column-right">
<?php
$platformID = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $platformID;

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
			<input type=\"hidden\" name=\"id\" value=\"" . $platformID . "\">
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
			<input type=\"hidden\" name=\"id\" value=\"" . $platformID . "\">
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