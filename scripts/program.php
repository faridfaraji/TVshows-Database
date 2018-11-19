<?php session_start();?>
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

function getCastType($sqlFormatted=true){
	switch ($_POST['tab1']) {
		default:
			return $sqlFormatted ? "\"Main cast\"" : "main cast member";
		case 2:
			return $sqlFormatted ? "\"Guest cast\"" : "guest cast member";
		case 3:
			return $sqlFormatted ? "\"Producer\"" : "producer";
		case 4:
			return $sqlFormatted ? "\"Crew\"" : "crew member";
	}
}

function isNullOrNumeric($string, $checkPercent=false){
	if ($string == "NULL"){
		return true;
	} else {
		return ((is_numeric($string) && floatval($string) > 0) && 
		(!$checkPercent || floatval($string) <= 100));
	}
}

$progID = $_GET['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $progID;

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
	
if (isset($_GET['title']) && !$conn->connect_error && (!isset($adminConn) || !$adminConn->connect_error)) {
	if (isset($_POST['stars'])) {
		$ip = $_SERVER['REMOTE_ADDR'];
		$stars = $_POST['stars'];
		$score = intval($stars) * 10;
		
		$sql = "SELECT reviewerID
				FROM User
				WHERE ip = \"" . $ip . "\"";
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			$reviewerID = $row['reviewerID'];
		} else {
			$sql = "INSERT INTO User (ip) VALUES
					(\"" . $ip . "\")";					
			$conn->query($sql);
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $conn->query($sql);	
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$reviewerID = $row['LAST_INSERT_ID()'];
			} else {
				$reviewerID = 0;
			}			
		}
		
		$sql = "SELECT R.reviewID, R.rating
				FROM Review R, UserReview UR
				WHERE R.reviewID = UR.reviewID
					AND UR.reviewerID = " . $reviewerID . "
					AND R.progID = " . $progID;
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			$reviewID = $row['reviewID'];
					
			$sql = "UPDATE Review
					SET rating = " . $score . "
					WHERE reviewID = " . $reviewID;
			$conn->query($sql);
		} else {	
			$sql = "INSERT INTO Review (rating, progID) VALUES
					(" . $score . ", " . $progID . ")";		
			$conn->query($sql);
			$sql = "SELECT LAST_INSERT_ID()";
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$reviewID = $row['LAST_INSERT_ID()'];
					
				$sql = "INSERT INTO UserReview (reviewerID, reviewID) VALUES
						(" . $reviewerID . ", " . $reviewID . ");";	
						
				$conn->query($sql);
			}				
		}
	} else if (isset($_POST['update'])) {	
		if (!isset($adminConn)){
			$showError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$title = empty($_POST['title']) ? "Untitled" : $_POST['title'];
			$releaseDate = empty($_POST['releaseDate']) ? "NULL" : $_POST['releaseDate'];
			$runtime = empty($_POST['runtime']) ? "NULL" : $_POST['runtime'];
			$budget = empty($_POST['budget']) ? "NULL" : $_POST['budget'];			
			
			$_GET['title'] = $title;
			
			if ($releaseDate != "NULL" && !checkMySQLDate($releaseDate)) {
				$showError = "<p>Invalid date.</p>";			
			} else if (!isNullOrNumeric($runtime)) {
				$showError = "<p>Runtime must be a non-zero number.</p>";		
			} else if (!isNullOrNumeric($budget)) {
				$showError = "<p>Budget must be a non-zero number.</p>";					
			} else {
				if ($releaseDate != "NULL") {
					$releaseDate = "'" . $releaseDate . "'";
				}
				
				$sql = "UPDATE Program
						SET name = \"" . $title . "\", 
							releaseDate = " . $releaseDate . ",
							runtime = " . $runtime . ",
							budget = " . $budget . "
						WHERE progID = " . $progID;
				$adminConn->query($sql);
			}
		}
	} else if (isset($_POST['delete'])) {	
		if (!isset($adminConn)){
			$showError = "<p>You are not authorized to perform that action.</p>";
		} else {			
			$sql = "DELETE FROM Program
					WHERE progID = " . $progID;
			$adminConn->query($sql);
			
			header('Location: /');
		}
	} else if (isset($_POST['deleteDirector'])) {
		if (!isset($adminConn)){
			$showError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$sql = "DELETE FROM WorksOn
					WHERE roleID = \"Director\"
						AND progID = " . $progID . "
						AND crewID = " . $_POST['deleteDirector'];
			$adminConn->query($sql);	
			unset($_POST['deleteDirector']);
		}
	} else if (isset($_POST['addDirector'])) {	
		if (!isset($adminConn)){
			$showError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$directorName = $_POST['directorName'];

			$sql = "SELECT crewID
					FROM CrewPerson
					WHERE name = \"" . $directorName . "\"";
			$result = $conn->query($sql);	
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$directorID = $row['crewID'];

				$sql = "SELECT crewID
						FROM WorksOn
						WHERE roleID = \"Director\"
							AND progID = " . $progID . "
							AND name = " . $directorName;
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$showError = "<p>Crew person " . $directorName . " can only work on " . $_GET['title'] . " once as a director.</p>";
				} else {
					$sql = "INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
							(" . $progID . ", " . $directorID . ", \"Director\", \"Directed By\")";	
						
					$adminConn->query($sql);
					
					unset($_POST['addDirector']);
					unset($_POST['directorName']);
				}
			} else {
				$showError = "<p>Crew person " . $directorName . " does not exist.</p>";
			}	
		}
	} else if (isset($_POST['deleteWriter'])) {
		if (!isset($adminConn)){
			$showError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$sql = "DELETE FROM WorksOn
					WHERE roleID = \"Writer\"
						AND progID = " . $progID . "
						AND crewID = " . $_POST['deleteWriter'];
			$adminConn->query($sql);	
			unset($_POST['deleteWriter']);
		}
	} else if (isset($_POST['addWriter'])) {	
		if (!isset($adminConn)){
			$showError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$writerName = $_POST['writerName'];

			$sql = "SELECT crewID
					FROM CrewPerson
					WHERE name = \"" . $writerName . "\"";
			$result = $conn->query($sql);	
			
			if ($result->num_rows > 0) {
				$row = $result->fetch_assoc();
				$writerID = $row['crewID'];

				$sql = "SELECT crewID
						FROM WorksOn
						WHERE roleID = \"Writer\"
							AND progID = " . $progID . "
							AND name = " . $writerName;
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$showError = "<p>Crew person " . $writerName . " can only work on " . $_GET['title'] . " once as a writer.</p>";
				} else {
					$sql = "INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
							(" . $progID . ", " . $writerID . ", \"Writer\", \"Written By\")";	
						
					$adminConn->query($sql);
					
					unset($_POST['addDirector']);
					unset($_POST['writerName']);
				}
			} else {
				$showError = "<p>Crew person " . $writerName . " does not exist.</p>";
			}	
		}
	} else if (isset($_POST['deleteCast'])) {
		if (!isset($adminConn)){
			$castError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$castID = $_POST['deleteCast'];
			$roleID = getCastType();
			
			$sql = "DELETE FROM WorksOn
					WHERE progID = " . $progID . "
						AND crewID = " . $castID . "
						AND roleID = " . $roleID;	
			$adminConn->query($sql);	
			unset($_POST['deleteCast']);
		}
	} else if (isset($_POST['updateCast'])) {	
		if (!isset($adminConn)){
			$castError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$castID = $_POST['updateCast'];
			$credit = $_POST['creditedAs' . $castID];
			$roleID = getCastType();

			$sql = "UPDATE WorksOn
					SET creditedAs = \"" . $credit . "\"
					WHERE progID = " . $progID . "
						AND crewID = " . $castID . "
						AND roleID = " . $roleID;				
			$adminConn->query($sql);
			
			unset($_POST['updateCast']);
			unset($_POST['creditedAs']);
		}
	} else if (isset($_POST['addCast'])) {
		if (!isset($adminConn)){
			$castError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$castName = $_POST['addCrewPerson'];
			$credit = $_POST['addCredit'];
			$roleID = getCastType();
			$plainRoleID = getCastType(false);
			
			if (empty($castName)) {
				$castError = "<p>Crew name cannot be empty.</p>";				
			} else {
				$sql = "SELECT crewID
						FROM CrewPerson
						WHERE name = \"" . $castName . "\"";
				$result = $conn->query($sql);	
				
				if ($result->num_rows > 0) {
					$row = $result->fetch_assoc();
					$castID = $row['crewID'];

					$sql = "SELECT crewID
							FROM WorksOn
							WHERE roleID = " . $roleID . "
								AND progID = " . $progID . "
								AND crewID = " . $castID;
					$result = $conn->query($sql);
					
					if ($result->num_rows > 0) {
						$castError = "<p>Crew person " . $castName . " can only work on " . $_GET['title'] . " once as a " . $plainRoleID . ".</p>";
					} else {
						$sql = "INSERT INTO WorksOn (progID, crewID, roleID, creditedAs) VALUES
								(" . $progID . ", " . $castID . ", " . $roleID . ", \"" . $credit . "\")";	
							
						$adminConn->query($sql);
						
						unset($_POST['addCast']);
						unset($_POST['castName']);
						unset($_POST['addCredit']);
					}
				} else {
					$castError = "<p>Crew person " . $castName . " does not exist.</p>";
				}	
			}
		}
	} else if (isset($_POST['deletePlatform'])) {
		if (!isset($adminConn)){
			$platformError = "<p>You are not authorized to perform that action.</p>";
		} else {
			switch ($_POST['tab2']) {					
				default:
					$oldDate = empty($_POST['updateOldDate' . $progID]) ? "NULL" : $_POST['updateOldDate' . $progID];
					$oldTime = empty($_POST['updateOldTime' . $progID]) ? "NULL" : $_POST['updateOldTime' . $progID];
					
					$sql = "DELETE FROM Broadcast
							WHERE progID = " . $progID . "
								AND platformID = " . $_POST['deletePlatform'] . "
								AND date = '" . $date . "'
								AND time = '" . $time . "'";
					$adminConn->query($sql);
					break;
				case 2:
					$date = empty($_POST['updateDate' . $progID]) ? "NULL" : $_POST['updateDate'];
					
					$sql = "DELETE FROM Stream
							WHERE progID = " . $progID . "
								AND platformID = " . $_POST['deletePlatform'] . "
								AND releaseDate = '" . $date . "'";
					$adminConn->query($sql);
					break;
			}
			
			unset($_POST['deletePlatform']);
		}
	} else if (isset($_POST['updatePlatform'])) {	
		if (!isset($adminConn)){
			$platformError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$platformID = $_POST['updatePlatform' . $progID];
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
			} else if ($_POST['tab2'] != 2 && ($time == "NULL" || !checkMySQLTime($time))) {
				$platformError = "<p>Invalid time.</p>";		
			} else {
				if ($time != "NULL") {
					$time = "'" . $time . "'";
				}
				
				switch ($_POST['tab2']) {					
					default:
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
							
						break;
					case 2:				
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
							
						break;
				}			
						
				unset($_POST['updatePlatform']);
				unset($_POST['updateDate']);
				unset($_POST['updateTime']);
				unset($_POST['updateLiveViewers']);
				unset($_POST['updateLiveShare']);
				unset($_POST['updateLivePlusThree']);
				unset($_POST['updateLivePlusSeven']);
			}
		}
	} else if (isset($_POST['addPlatform'])) {
		if (!isset($adminConn)){
			$castError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$platformType = ($_POST['tab2'] == 2) ? "Stream" : "Broadcast";
			$platformName = $_POST['addPlatformName'];
			$date = empty($_POST['addDate']) ? "NULL" : $_POST['addDate'];
			$time = empty($_POST['addTime']) ? "NULL" : $_POST['addTime'];
			$dayOfViewers = empty($_POST['addLiveViewers']) ? "NULL" : $_POST['addLiveViewers'];
			$dayOfShare = empty($_POST['addLiveShare']) ? "NULL" : $_POST['addLiveShare'];
			$livePlusThree = empty($_POST['addLivePlusThree']) ? "NULL" : $_POST['addLivePlusThree'];
			$livePlusSeven = empty($_POST['addLivePlusSeven']) ? "NULL" : $_POST['addLivePlusSeven'];
			
			if (empty($platformName)) {
				$platformError = "<p>A platform must be specified.</p>";			
			} else {
				$sql = "SELECT platformID, isNetwork
						FROM Platform
						WHERE name = \"" . $platformName . "\"";					
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$row = $result->fetch_assoc();
					$platformID = $row['platformID'];
					$isNetwork = $row['isNetwork'];
				
					if ($isNetwork && ($platformType == "Stream")) {
						$platformError = "<p>" . $platformName . " is not a television network.</p>";
					} else if (!$isNetwork && ($platformType == "Broadcast")) {
						$platformError = "<p>" . $platformName . " is not a streaming service.</p>";
					} else if (!isNullOrNumeric($dayOfViewers)) {
						$platformError = "<p>Viewership must be a nonzero number (in millions).</p>";
					} else if (!isNullOrNumeric($dayOfShare, true) || 
								!isNullOrNumeric($livePlusThree, true) || 
								!isNullOrNumeric($livePlusSeven, true)) {
						$platformError = "<p>Viewer share must be a nonzero percentage.</p>";	
					} else if ($date != "NULL" && !checkMySQLDate($date)) {
						$platformError = "<p>Invalid date.</p>";			
					} else if (($platformType == "Stream" && $time != "NULL") || !checkMySQLTime($time)) {
						$platformError = "<p>Invalid time.</p>";		
					} else {
						if ($date != "NULL") {
							$date = "'" . $date . "'";
						}
						
						switch ($platformType) {
							case "Broadcast":
								$sql = "SELECT date, time
										FROM BroadcastSchedule
										WHERE platformID = " . $platformID . "
											AND date = " . $date . "
											AND time = '" . $time . "'";										
								$result = $conn->query($sql);
								
								if (!($result->num_rows > 0)) {
									$sql = "INSERT INTO BroadcastSchedule (platformID, date, time) VALUES
											(" . $platformID . ", " . $date . ", '" . $time . "')";									
									$adminConn->query($sql);								
								}
								
								$sql = "SELECT B.date, B.time, P.name
										FROM Broadcast, Program P
										WHERE B.platformID = " . $platformID . "
											AND B.date = " . $date . "
											AND B.time = '" . $time . "'
											AND B.progID = P.progID";											
								$result = $conn->query($sql);
								
								if ($result->num_rows > 0) {
									$row = $result->fetch_assoc();
									$conflictName = $row['name'];
									
									$platformError = "<p>" . $platformName . " is already broadcasting " . $conflictName . " at this time.</p>";								
								} else {
									$sql = "INSERT INTO Broadcast (platformID, date, time, progID, dayOfViewers, 
												dayOfShare, livePlusThree, livePlusSeven) VALUES
											(" . $platformID . ", " . $date . ", '" . $time . "', " . $progID . ", " . 
											$dayOfViewers . ", " . $dayOfShare . ", " . $livePlusThree . ", " . $livePlusSeven . ")";	
											
									$adminConn->query($sql);	
									$platformSuccess = true;
								}
									
								break;
							case "Stream":
								$sql = "SELECT releaseDate
										FROM Stream
										WHERE platformID = " . $platformID . "
											AND progID = " . $progID;	
											
								$result = $conn->query($sql);
								
								if ($result->num_rows > 0) {	
									$platformError = "<p>" . $platformName . " cannot release " . $_GET['title'] . " twice.</p>";
								} else {						
									$sql = "INSERT INTO Stream (platformID, progID, releaseDate) VALUES
											(" . $platformID . ", '" . $progID . ", " . $date . ")";	
									$platformSuccess = true;
								}
												
								$adminConn->query($sql);
									
								break;
						}			
							
						if ($platformSuccess) {
							unset($_POST['addPlatform']);
							unset($_POST['addPlatformName']);
							unset($_POST['addDate']);
							unset($_POST['addTime']);
							unset($_POST['addLiveViewers']);
							unset($_POST['addLiveShare']);
							unset($_POST['addLivePlusThree']);
							unset($_POST['addLivePlusSeven']);
						}
					}
				} else {
					$platformError = "<p>Platform " . $platformName . " does not exist.</p>";
				}
			}
		}
	} else if (isset($_POST['deleteAwardCrew'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$exploded = explode('&^', $_POST['deleteAwardCrew']);
			
			$awardOrganization = $exploded[0];
			$awardName = $exploded[1];
			$awardDate = $exploded[2];
			$crewID = $exploded[3];
			
			$sql = "DELETE FROM AwardForProgramForCrewPerson
					WHERE awardOrganization = \"" . $awardOrganization . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND crewID = " . $crewID;
			$adminConn->query($sql);
	
			unset($_POST['deleteAwardCrew']);
		}
	} else if (isset($_POST['addAwardCrew'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$exploded = explode('&^', $_POST['addAwardCrew']);
			
			$awardOrganization = $exploded[0];
			$awardName = $exploded[1];
			$awardDate = $exploded[2];
			$crewName = $_POST['addAwardCrewName'];
			
			if (empty($crewName)) {
				$awardError = "<p>Crew name cannot be empty.</p>";				
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
								(\"" . $awardOrganization . "\", \"" . $awardName . "\", '" . $awardDate . "', " . $progID . ", " . $crewID . ")";

						$adminConn->query($sql);	
						
						unset($_POST['addAwardCrew']);
					} else {
						$awardError = "<p>Crew person " . $crewName . " did not work on " . $_GET['title'] . ".<p>";
					}
				} else {
					$awardError = "<p>Crew person " . $crewName . " does not exist.<p>";
				}
			}
		}
	} else if (isset($_POST['deleteAward'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$exploded = explode('&^', $_POST['deleteAward']);
			
			$awardOrganization = $exploded[0];
			$awardName = $exploded[1];
			$awardDate = $exploded[2];
			
			$sql = "DELETE FROM AwardForProgram
					WHERE awardOrganization = \"" . $awardOrganization . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND progID = " . $progID;
			$adminConn->query($sql);
			
			$sql = "DELETE FROM Award
					WHERE awardOrganization = \"" . $awardOrganization . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'";
			$adminConn->query($sql);
	
			unset($_POST['deleteAward']);
		}
	} else if (isset($_POST['updateAward'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {
			$exploded = explode('&^', $_POST['updateAward']);
			
			$awardOrganization = $exploded[0];
			$awardName = $exploded[1];
			$awardDate = $exploded[2];
			
			$wonIndex = str_replace(' ', '_', $_POST['updateAward'] . "&^won");		
			$won = $_POST[$wonIndex];
			
			$sql = "UPDATE AwardForProgram
					SET won = " . ($won ? "TRUE" : "FALSE") . "
					WHERE awardOrganization = \"" . $awardOrganization . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND progID = " . $progID;
			$adminConn->query($sql);
			
			unset($_POST['updateAward']);
			unset($_POST[$wonIndex]);
		}
	} else if (isset($_POST['addAward'])) {
		if (!isset($adminConn)){
			$awardError = "<p>You are not authorized to perform that action.</p>";
		} else {		
			$awardOrganization = $_POST['addAwardOrganization'];
			$awardName = $_POST['addAwardName'];
			$awardDate = $_POST['addAwardDate'];
			$won = $_POST['addAwardWon'] ? "TRUE" : "FALSE";
			
			$sql = "SELECT awardOrganization, awardName, date
					FROM AwardForProgram
					WHERE awardOrganization = \"" . $awardOrganization . "\"
						AND awardName = \"" . $awardName . "\"
						AND date = '" . $awardDate . "'
						AND progID = " . $progID;
			$result = $conn->query($sql);
			
			if ($result->num_rows > 0) {
				$awardError = "<p>" . $_GET['title'] . " has already won this award.</p>";
			} else {
				if (empty($awardOrganization) || empty($awardName) || empty($awardDate)){
					$awardError = "<p>Award organization, name, and date cannot be empty.</p>";
				} else if (!checkMySQLDate($awardDate)) {
					$awardError = "<p>Invalid date.</p>";				
				} else {			
					$sql = "SELECT awardOrganization, awardName, date
							FROM Award
							WHERE awardOrganization = \"" . $awardOrganization . "\"
								AND awardName = \"" . $awardName . "\"
								AND date = '" . $awardDate . "'";
					$result = $conn->query($sql);
				
					if (!($result->num_rows > 0)) {
						$sql = "INSERT INTO Award (awardOrganization, awardName, date) VALUES
										(\"" . $awardOrganization . "\", \"" . $awardName . "\", '" . $awardDate . "')";
						$adminConn->query($sql);				
					}
					
					$sql = "INSERT INTO AwardForProgram (awardOrganization, awardName, date, progID, won) VALUES
									(\"" . $awardOrganization . "\", \"" . $awardName . "\", '" . $awardDate . "', " . $progID . ", " . $won . ")";
					$adminConn->query($sql);	
	
					unset($_POST['deleteAwardCrew']);
				}
			}
		}
	}
	
	$title = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
		("<input type=\"text\" class=\"title\" name=\"title\" size=\"30\" value=\"" . $_GET['title'] . "\">") : 
		$_GET['title'];
	
	echo "<form action=\"" . $selfURL . "\" method=\"post\">
			<span class=\"padded-content-header\"><h3>" . $title . "&nbsp;</h3></span>
			<span class=\"info-header\">";
	
	$sql = "SELECT SE.name, E.serialID, E.seasonID, E.epID
			FROM Episode E, Serial SE
			WHERE E.serialID = SE.serialID
				AND E.progID = " . $progID;
	$result = $conn->query($sql);

	if ($result->num_rows > 0) {
		$row = $result->fetch_assoc();
		
		$serialID = $row['serialID'];
		$seasonID = $row['seasonID'];
		
		$showLink = "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/serial?id=" . $serialID . "\"><i>" . $row['name'] . "</i></a>";
		$seasonLink = "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/season?serialID=" . $serialID . "&seasonID=" . $seasonID . "\">
			S" . $seasonID . "E" . $row['epID'] . "</a>";
		
		echo $showLink . " " . $seasonLink;
	} else {
		echo "&nbsp;";
	}
		
	if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
		echo "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/add_review?progID=" . $progID . "\">
				<input type=\"button\" class=\"right inline\" value=\"Add Review\">
			  </a>";
	} else if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/user_reviews?id=" . $progID . "\">
				<input type=\"button\" class=\"right inline\" value=\"Manage User Reviews\">
			  </a>";
	} else {
		$sql = "SELECT R.rating
				FROM Review R, UserReview UR, User U
				WHERE R.reviewID = UR.reviewID
					AND UR.reviewerID = U.reviewerID
					AND U.ip = \"" . $_SERVER['REMOTE_ADDR'] . "\"
					AND R.progID = " . $progID;
		$result = $conn->query($sql);

		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			$currentRating = intval($row['rating']) / 10;
		} else {
			$currentRating = 0;
		}
		
		echo "<div class=\"right\">
				<form class=\"inline\" action=\"" . $_SERVER['PHP_SELF'] . "?id=" . $progID . "\" method=\"post\">
					<input type=\"hidden\" name=\"tab1\" value=\"" . $_POST['tab1'] . "\">
					<input type=\"hidden\" name=\"tab2\" value=\"" . $_POST['tab2'] . "\">";
		
		for ($i=1; $i<=$currentRating; $i++) {
			echo "<button class=\"plain\" name=\"stars\" value=\"" . $i . "\" type=\"submit\">★</button>";
		}
		
		for ($i=$currentRating + 1; $i<=10; $i++) {
			echo "<button class=\"plain\" name=\"stars\" value=\"" . $i . "\" type=\"submit\">☆</button>";
		}
		
		echo "</form></div>";
	}
		
	echo "</span>
		  <div class=\"column-left\">
				<table class=\"plain\">
					<tr><th>Director</th><td><table class=\"plain no-pad\">";
			
	$sql = "SELECT C.crewID, C.name
			FROM CrewPerson C, WorksOn W
			WHERE C.crewID = W.crewID
				AND W.roleID = \"Director\"
				AND W.progID = " . $progID;
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			echo "<tr><td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/crew?id=" . $row['crewID'] . "\">" . $row['name'] . "</a></td>";
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td><form class=\"inline\" action=\"" . $selfURL . "\" method=\"post\">
						<button class=\"small-inline\" type=\"submit\" name=\"deleteDirector\" value=\"" . $row['crewID'] . "\">Delete</button>
					</form></td>";
			}
		}
	}	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<tr><form class=\"inline\" action=\"" . $selfURL . "\" method=\"post\">
				<td><input type=\"text\" size=\"20\" name=\"directorName\" required></td>
				<td><button class=\"small-inline\" type=\"submit\" name=\"addDirector\">Add</button></td>
			</form>";
	}
	
	echo "</table></td><th>Writer</th><td><table class=\"plain no-pad\">";
			
	$sql = "SELECT C.crewID, C.name
			FROM CrewPerson C, WorksOn W
			WHERE C.crewID = W.crewID
				AND W.roleID = \"Writer\"
				AND W.progID = " . $progID;
	$result = $conn->query($sql);
	
	if ($result->num_rows > 0) {
		while ($row = $result->fetch_assoc()) {
			echo "<tr><td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/crew?id=" . $row['crewID'] . "\">" . $row['name'] . "</a></td>";
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td><form class=\"inline\" action=\"" . $selfURL . "\" method=\"post\">
						<button class=\"small-inline\" type=\"submit\" name=\"deleteWriter\" value=\"" . $row['crewID'] . "\">Delete</button>
					</form></td>";
			}
		}
	}	
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<tr><form class=\"inline\" action=\"" . $selfURL . "\" method=\"post\">
				<td><input type=\"text\" size=\"20\" name=\"writerName\" required></td>
				<td><button class=\"small-inline\" type=\"submit\" name=\"addWriter\">Add</button>
			</form></td>";
	}
	
	echo "</table></td></tr>";
	
	$sql = "SELECT releaseDate, runtime, budget
			FROM Program P
			WHERE progID = " . $progID;
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();
	
	$missing = "<span class=\"no-rating\">N/A</span>";
	$admin_missing = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "" : $missing;
	$button = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
		"<button type=\"submit\" name=\"update\">Update</button>				
		<form action=\"" . $selfURL . "\" method=\"post\" class=\"inline\">
			<button type=\"submit\" name=\"delete\" class=\"right\">Delete</button>
		</form>" : "";
	$releaseDate = adP(empty($row['releaseDate']) ? $admin_missing : $row['releaseDate'], 'releaseDate');
	$runtime = adP(empty($row['runtime']) ? $admin_missing : $row['runtime'], 'runtime') . 
		((!empty($row['runtime']) || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) ? " minutes" : "");
	$budget = ((!empty($row['budget']) || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) ? "$ " : "") .
		adP(empty($row['budget']) ? $admin_missing : $row['budget'], 'budget') .
		((!empty($row['budget']) || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) ? " mil" : "");
	echo "<tr><th>Release Date</th><td>" . $releaseDate . "</td>
			<th>Runtime</th><td>" . $runtime . "</td></tr>
			<tr><th>Budget</th><td>" . $budget . "</td></tr>
			</table>" . $button;
		
	$sql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
			FROM Review R
			WHERE EXISTS(SELECT reviewID
						FROM CriticReview CR
						WHERE CR.reviewID = R.reviewID)
				AND R.progID = " . $progID;
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();	
	$criticRating = isset($row['rating']) ? round($row['rating'], 2) : -1;
	$criticCount = empty($row['count']) ? 0 : $row['count'];
	
	$sql = "SELECT AVG(R.rating) AS rating, COUNT(R.rating) AS count
			FROM Review R
			WHERE EXISTS(SELECT reviewID
						FROM UserReview UR
						WHERE UR.reviewID = R.reviewID)
				AND R.progID = " . $progID;
	$result = $conn->query($sql);
	$row = $result->fetch_assoc();	
	$userRating = isset($row['rating']) ? round($row['rating'], 2) : -1;
	$userCount = empty($row['count']) ? 0 : $row['count'];
	
	echo "</div>
		  <div class=\"column-right\">
			<table class=\"plain right centered\" align=\"right\">
				<tr><th><span class=\"rating\">" .
				(($criticRating == -1) ? ($missing . "</span>") : ($criticRating . "</span> %")) .
				"</th></tr>
				<tr><th>Critic Rating</th></tr>
				<tr><td>Based on " . $criticCount . " reviews</td></tr>
				<tr><th><span class=\"rating\">" .
				(($userRating == -1) ? ($missing . "</span>") : ($userRating . "</span> %")) .
				"</th></tr>
				<tr><th>User Rating</th></tr>
				<tr><td>Based on " . $userCount . " reviews</td></tr>
				<tr><td>&nbsp;</td></tr>
			</table>
		</div></form>";
		
	if (isset($showError)) {
		echo $showError;
	}
		
	echo "<span id=\"cast\" class=\"content-header\"><h3>Cast and Crew</h3></span>
		
		<form class=\"tab\" action=\"" . $selfURL . "#cast\" method=\"post\">
			<input type=\"hidden\" name=\"tab2\" value=\"" . $_POST['tab2'] . "\">
			<p>
				<button class=\"tab\" type=\"submit\" name=\"tab1\" value=\"1\">Main cast</button>
				<button class=\"tab\" type=\"submit\" name=\"tab1\" value=\"2\">Guest cast</button>
				<button class=\"tab\" type=\"submit\" name=\"tab1\" value=\"3\">Producers</button>
				<button class=\"tab\" type=\"submit\" name=\"tab1\" value=\"4\">Other crew</button>
			</p>
		</form>";
		
	$currentTab1 = 1;
	if (isset($_POST['tab1'])){
		$currentTab1 = $_POST['tab1'];
	} else {
		$_POST['tab1'] = $currentTab1;
	}
	
	switch ($currentTab1) {
		default:
			$crewSql = "SELECT C.crewID, C.name, W.creditedAs
					FROM CrewPerson C, WorksOn W
					WHERE C.crewID = W.crewID
						AND W.roleID = \"Main cast\"
						AND W.progID = " . $progID;
			break;
		case 2:
			$crewSql = "SELECT C.crewID, C.name, W.creditedAs
					FROM CrewPerson C, WorksOn W
					WHERE C.crewID = W.crewID
						AND W.roleID = \"Guest cast\"
						AND W.progID = " . $progID;	
			break;
		case 3:
			$crewSql = "SELECT C.crewID, C.name, W.creditedAs
					FROM CrewPerson C, WorksOn W
					WHERE C.crewID = W.crewID
						AND W.roleID = \"Producer\"
						AND W.progID = " . $progID;	
			break;
		case 4:
			$crewSql = "SELECT C.crewID, C.name, W.creditedAs
					FROM CrewPerson C, WorksOn W
					WHERE C.crewID = W.crewID
						AND W.roleID = \"Crew\"
						AND W.progID = " . $progID;	
			break;
	}
	
	$crewResult = $conn->query($crewSql);
			
	if ($crewResult->num_rows > 0 || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) {
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<form action=\"" . $selfURL . "#cast\" method=\"post\">";
		}
			
		echo "<table class=\"listing\">
				<tr><th>Name</th><th>Credited Role</th>" . ((isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "<th>Manage</th>" : "") . "</tr>";
			
		while ($crewResult->num_rows > 0 && $row = $crewResult->fetch_assoc()) {
			echo "<tr>
					<td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/crew?id=" . $row['crewID'] . "\">" . $row['name'] . "</a></td>
					<td>" . adP($row['creditedAs'], 'creditedAs' . $crewID) . "</td>";
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td align=\"center\" width=\"150px\">
						<input type=\"hidden\" name=\"tab1\" value=\"" . $_POST['tab1'] . "\">
						<button class=\"small-inline\" type=\"submit\" name=\"updateCast\" value=\"" . $row['crewID'] . "\">Update</button>
						<button class=\"small-inline\" type=\"submit\" name=\"deleteCast\" value=\"" . $row['crewID'] . "\">Delete</button>
					</td>";
			}
		}
	
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
			echo "<tr><form action=\"" . $selfURL . "#cast\" method=\"post\">
					<input type=\"hidden\" name=\"tab1\" value=\"" . $_POST['tab1'] . "\">
					<td><input type=\"text\" size=\"20\" name=\"addCrewPerson\"></td>
					<td><input type=\"text\" size=\"20\" name=\"addCredit\"></td>
					<td align=\"center\" width=\"150px\">
						<button class=\"small-inline\" type=\"submit\" name=\"addCast\">Add</button>
					</td>
				</form></tr>";
		}
		
		echo "</table>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "</form>";
		}
	} else {
		echo "<p>No results available...</p>";
	}
		
	if (isset($castError)) {
		echo $castError;
	}
	
	echo "<span id=\"broadcast\" class=\"content-header\"><h3>Broadcasts</h3></span>
	
			<form class=\"tab\" action=\"" . $selfURL . "#broadcast\" method=\"post\">
				<input type=\"hidden\" name=\"tab1\" value=\"" . $_POST['tab1'] . "\">
				<p>
					<button class=\"tab\" type=\"submit\" name=\"tab2\" value=\"1\">Networks</button>
					<button class=\"tab\" type=\"submit\" name=\"tab2\" value=\"2\">Streaming Services</button>
				</p>
			</form>";
		
	$currentTab2 = 1;
	if (isset($_POST['tab2'])){
		$currentTab2 = $_POST['tab2'];
	} else {
		$_POST['tab2'] = $currentTab2;
	}
	
	switch ($currentTab2) {
		default:
			$broadcastSql = "SELECT P.platformID, P.name, B.date, B.time, 
						B.dayOfViewers, B.dayOfShare, 
						B.livePlusThree, B.livePlusSeven
					FROM Broadcast B, Platform P
					WHERE B.platformID = P.platformID
						AND B.progID = " . $progID;
			$edgeSize = 200;
			break;
		case 2:
			$broadcastSql = "SELECT P.platformID, P.name, S.releaseDate AS date
					FROM Stream S, Platform P
					WHERE S.platformID = P.platformID
						AND S.progID = " . $progID;	
			$edgeSize = 150;
			break;
	}
	
	$broadcastResult = $conn->query($broadcastSql);
			
	if ($broadcastResult->num_rows > 0 || isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {			
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<form action=\"" . $selfURL . "#broadcast\" method=\"post\">
					<input type=\"hidden\" name=\"tab2\" value=\"" . $_POST['tab2'] . "\">";
		}
			
		echo "<table class=\"listing\">
				<tr><th>Network</th><th>Date</th>";
		
		if ($currentTab2 != 2) {
			echo "<th>Live Viewers</th><th>Live Share</th>
				  <th>Live+3 Share</th><th>Live +7 Share</th>";
		}	
		
		echo ($_SESSION['is_admin'] ? "<th>Manage</th>" : "") . "</tr>";
			
		while ($broadcastResult->num_rows > 0 && $row = $broadcastResult->fetch_assoc()) {
			echo "<tr>";
			
			echo "<td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/platform?id=" . $row['platformID'] . "\">" . $row['name'] . "</a></td>";
					
			switch ($currentTab2) {
				default:
					$dayOfViewers = (empty($row['dayOfViewers'])) ? $adminMissing : $row['dayOfViewers'];
					$dayOfShare = (empty($row['dayOfShare'])) ? $adminMissing : $row['dayOfShare'];
					$livePlusThree = (empty($row['livePlusThree'])) ? $adminMissing : $row['livePlusThree'];
					$livePlusSeven = (empty($row['livePlusSeven'])) ? $adminMissing : $row['livePlusSeven'];
				
					echo "<input type=\"hidden\" name=\"updateOldDate\" value=\"" . $row['date'] . "\">
							<input type=\"hidden\" name=\"updateOldTime\" value=\"" . $row['time'] . "\">
							<td align=\"center\">" . adP($row['date'], 'updateDate' . $progID, false, 7) . " " . adP($row['time'], 'updateTime', false, 5) . "</td>
							<td align=\"center\">" . adP($dayOfViewers, 'updateLiveViewers' . $progID, false, 5) . "</td>
							<td align=\"center\">" . adP($dayOfShare, 'updateLiveShare' . $progID, false, 5) . "</td>
							<td align=\"center\">" . adP($livePlusThree, 'updatePlusThree' . $progID, false, 5) . "</td>
							<td align=\"center\">" . adP($livePlusSeven, 'updatePlusSeven' . $progID, false, 5) . "</td>";	
					break;
				case 2:
					echo "<input type=\"hidden\" name=\"updateOldDate\" value=\"" . $row['date'] . "\">
							<td align=\"center\">" . adP($row['date'], 'updateDate') . "</td>";
					break;
			}
			
					
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td align=\"center\" width=\"" . $edgeSize . "px\">
						<button class=\"small-inline\" type=\"submit\" name=\"updatePlatform\" value=\"" . $row['platformID'] . "\">Update</button>
						<button class=\"small-inline\" type=\"submit\" name=\"deletePlatform\" value=\"" . $row['platformID'] . "\">Delete</button>
					</td>";
			}
		}
	
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
			echo "<tr><form action=\"" . $selfURL . "#broadcast\" method=\"post\">
					<input type=\"hidden\" name=\"tab2\" value=\"" . $_POST['tab2'] . "\">
					<td><input type=\"text\" size=\"20\" name=\"addPlatformName\"></td>";
					
			switch ($currentTab2) {
				default:
					echo "<td align=\"center\" width=\"200px\">" . adP('', 'addDate', false, 7) . 
							adP('', 'addTime', false, 5) . "</td>
						  <td>" . adP('', 'addLiveViewers', false, 5) . "</td>
						  <td>" . adP('', 'addLiveShare', false, 5) . "</td>
						  <td>" . adP('', 'addPlusThree', false, 5) . "</td>
						  <td>" . adP('', 'addPlusSeven', false, 5) . "</td>";
					break;
				case 2:
					echo "<td align=\"center\">" . adP('', 'addDate') . "</td>";
					break;
			}
			echo "<td align=\"center\" width=\"100px\">
						<button class=\"small-inline\" type=\"submit\" name=\"addPlatform\">Add</button>
					</td>
				</form></tr>";
		}
		
		echo "</table></form>";
	} else {
		echo "<p>No results available...</p>";
	}
		
	if (isset($platformError)) {
		echo $platformError;
	}
	
	echo "<span id=\"reviews\" class=\"content-header\"><h3>Reviews</h3></span>";
			
	$sql = "SELECT R.reviewID, R.rating, CR.title, CR.textExcerpt
			FROM Review R 
			JOIN CriticReview CR ON R.reviewID = CR.reviewID 
			WHERE R.progID = " . $progID . "
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
		
	echo "</table>
		<span id=\"awards\" class=\"content-header\"><h3>Awards and Nominations</h3></span>";
			
	$sql = "SELECT awardOrganization, awardName, date, won
			FROM AwardForProgram
			WHERE progID = " . $progID . "
			ORDER BY date DESC";
	
	$result = $conn->query($sql);
			
	if ($result->num_rows > 0 || isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<form action=\"" . $selfURL . "#awards\" method=\"post\"><table class=\"listing\">
			<tr>
				<th>Organization</th>
				<th>Award</th>
				<th>Date</th>
				<th>Won</th>
				<th>Nominated Crew</th>";
		
		if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
			echo "<th>Manage</th>";
		}
		
		echo "</tr>";
		
		while ($row = $result->fetch_assoc()) {
			$organization = $row['awardOrganization'];
			$name = $row['awardName'];
			$date = $row['date'];
			$comb = $organization . "&^" . $name . "&^" . $date;
			
			$checked = ($row['won']) ? "checked" : "";
			$won = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? 
				("<td align=\"center\"><input type=\"checkbox\" name=\"" . $comb . "&^won\"" . $checked . "></td>") : $row['won'];
			
			echo "<tr>
					<td><a href=\"http://" . $_SERVER['HTTP_HOST'] . "/award?id=" . $organization . "\">" . $organization . "</a></td>
					<td>" . $name . "</td>
					<td align=\"center\">" . $date . "</td>";	
				
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']){
				echo $won;
			} else if ($row['won']){
				echo "<td class=\"won\" align=\"center\">Won</td>";
			} else {
				echo "<td class=\"nominated\" align=\"center\">Nominated</td>";				
			}
			
			$innerSql = "SELECT C.crewID, C.name
						FROM AwardForProgramForCrewPerson A, CrewPerson C
						WHERE A.crewID = C.crewID
							AND A.awardOrganization = \"" . $row['awardOrganization'] . "\"
							AND A.awardName = \"" . $row['awardName'] . "\"
							AND A.date = '" . $row['date'] . "'";
			$innerResult = $conn->query($innerSql);
			
			if ($innerResult->num_rows > 0 || (isset($_SESSION['is_admin']) && $_SESSION['is_admin'])) {
				echo "<td align=\"center\">";
						
				while ($innerResult->num_rows > 0 && $innerRow = $innerResult->fetch_assoc()) {
					$awardButton = (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) ? "<button type=\"submit\" name=\"deleteAwardCrew\" class=\"small-inline\" 
						value=\"" . $comb . "&^" . $innerRow['crewID'] . "\">Delete</button>" : "";
					echo "<p><form action=\"" . $selfURL . "#awards\" method=\"post\">
							<a href=\"http://" . $_SERVER['HTTP_HOST'] . "/crew?id=" . $innerRow['crewID'] . "\">
							" . $innerRow['name'] . "</a>" . $awardButton . "</form></p>";
				}
				
				if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
					echo "<p><form action=\"" . $selfURL . "#awards\" method=\"post\">
							<input type=\"text\" size=\"5\" name=\"addAwardCrewName\">
							<button class=\"small-inline\" type=\"submit\" name=\"addAwardCrew\" value=\"" . $comb . "\">Add</button>
						</form></p></td>";
				}
			} else {
				echo "<td align=\"center\">" . $missing . "</td>";
			}
			
			if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
				echo "<td align=\"center\" width=\"50px\">
						<button class=\"small-inline\" type=\"submit\" name=\"updateAward\" value=\"" . $comb . "\">Update</button>
						<button class=\"small-inline\" type=\"submit\" name=\"deleteAward\" value=\"" . $comb . "\">Delete</button>
					</td>";
			}
			
			echo "</tr></form>";
		}
	} else {
		echo "<p>No results available...</p>";			
	}
					
	if (isset($_SESSION['is_admin']) && $_SESSION['is_admin']) {
		echo "<tr>
				<td><input type=\"text\" size=\"25\" name=\"addAwardOrganization\"></td>
				<td><input type=\"text\" size=\"15\" name=\"addAwardName\"></td>
				<td><input type=\"text\" size=\"7\" name=\"addAwardDate\"></td>
				<td align=\"center\"><input type=\"checkbox\" name=\"addAwardWon\"></td>
				<td align=\"center\">" . $missing . "</td>
				<td align=\"center\" width=\"50px\">
					<button class=\"small-inline\" type=\"submit\" name=\"addAward\">Add</button>
				</td>
			</tr>";
	}
		
	echo "</table></form>";
	
	if (isset($awardError)) {
		echo $awardError;
	}

	if (isset($adminConn)){
		$adminConn->close();
	}
	$conn->close();
} else {
	echo "<span class=\"content-header\"><h3>Not Found</h3></span>
		<p>Program information is not available...</p>";
}
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