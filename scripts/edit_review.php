<?php ob_start(); session_start(); ?>
<html>
	<head>
		<meta charset="utf-8"/>		
		<title>Edit Review | Untitled Review Website</title>		
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

$servername = "localhost:3306";
$username = $_SESSION['username'];
$password = $_SESSION['password'];
$dbname = "untitled_review_website";

$review_id = htmlspecialchars($_GET["id"]);
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $review_id;

if (isset($_SESSION['is_critic']) && $_SESSION['is_critic']) {
	echo "<span class=\"content-header\"><h3>Edit Review</h3></span>";
		  
	$error = false;
	$conn = new mysqli($servername, $username, $password, $dbname);

	if ($conn->connect_error) {
		$error = true;
	}
	else {
		if (isset($_POST)) {
			if (isset($_POST['addPub'])) {
				$newPubName = htmlspecialchars($_POST['newPubName']);
				$newPubDate = htmlspecialchars($_POST['newPubDate']);
				
				if (!checkMySQLDate($newPubDate)) {
					$pub_error = "<p>Invalid date.</p>";
				} else {
					$sql = "SELECT publicationName 
							FROM Publication 
							WHERE publicationName = \"" . $newPubName . "\";";
					$result = $conn->query($sql);
					
					if ($result->num_rows > 0) {
						$sql = "SELECT publicationName
								FROM Publishes 
								WHERE publicationName = \"" . $newPubName . "\"
									AND reviewID = " . $review_id . ";";
						$result = $conn->query($sql);
					
						if ($result->num_rows > 0) {
							$pub_error = "<p>Publication " . $newPubName . " can only publish this review once.</p>";
						} else {
							$sql = "INSERT INTO Publishes (publicationName, reviewID, date) VALUES
									(\"" . $newPubName . "\", " . $review_id . ", '" . $newPubDate . "');";
							$conn->query($sql);
							$updated = true;
						}
					} else {
						$pub_error = "<p>Publication " . $newPubName . " does not exist.</p>";
					}
				}
				
				unset($_POST['addPub']);
				unset($_POST['newPubName']);
				unset($_POST['newPubDate']);
			} else if (isset($_POST['updatePub'])) {
				$pubName = htmlspecialchars($_POST['updatePub']);
				$newPubDate = htmlspecialchars($_POST['pubDate']);
				
				if (!checkMySQLDate($newPubDate)) {
					$pub_error = "<p>Invalid date.</p>";
				} else {
					$sql = "UPDATE Publishes
							SET date = '" . $newPubDate . "'
							WHERE publicationName = \"" . $pubName . "\"
								AND reviewID = " . $review_id . ";";
					$result = $conn->query($sql);
					$updated = true;
				}
				
				unset($_POST['updatePub']);
				unset($_POST['pubDate']);				
			} else if (isset($_POST['deletePub'])) {
				$pubName = htmlspecialchars($_POST['deletePub']);
				$sql = "DELETE FROM Publishes
						WHERE publicationName = \"" . $pubName . "\"
							AND reviewID = " . $review_id . ";";
				$result = $conn->query($sql);
				$updated = true;
				
				unset($_POST['deletePub']);
				unset($_POST['pubDate']);					
			} else if (isset($_POST['addAuthor'])) {
				$newAuthorName = htmlspecialchars($_POST['newAuthorName']);
				
				$sql = "SELECT reviewerID
						FROM Critic 
						WHERE name = \"" . $newAuthorName . "\";";
				$result = $conn->query($sql);
				
				if ($result->num_rows > 0) {
					$row = $result->fetch_assoc();
					$newReviewerID = $row['reviewerID'];
					$sql = "SELECT reviewerID
							FROM CriticWrites 
							WHERE reviewerID = " . $newReviewerID . "
								AND reviewID = " . $review_id . ";";
					$result = $conn->query($sql);
				
					if ($result->num_rows > 0) {
						$author_error = "<p>Author " . $newAuthorName . " can only write this review once.</p>";
					} else {
						$innerSql = "INSERT INTO CriticWrites (reviewerID, reviewID) VALUES
									(\"" . $newReviewerID . "\", " . $review_id . ");";
						$conn->query($innerSql);
						
						$updated = true;
					}
				} else {
					$author_error = "<p>Author " . $newAuthorName . " does not exist.</p>";
				}
				
				unset($_POST['addAuthor']);	
				unset($_POST['newAuthorName']);		
			} else if (isset($_POST['deleteAuthor'])) {
				$deleteAuthor = htmlspecialchars($_POST['deleteAuthor']);
				$sql = "DELETE FROM CriticWrites
						WHERE reviewerID = \"" . $deleteAuthor . "\"
							AND reviewID = " . $review_id . ";";
				$result = $conn->query($sql);
				$updated = true;
				
				unset($_POST['deleteAuthor']);					
			} else if (isset($_POST['edit'])) {
				$rating = htmlspecialchars($_POST['rating']);
				$title = htmlspecialchars($_POST['title']);
				$textExcerpt = htmlspecialchars($_POST['textExcerpt']);
				
				if (strlen($title) > 250) {
					$review_error = "<p>Title must be 250 characters or less.</p>";
				} else if (strlen($textExcerpt) > 1000) {
					$review_error = "<p>Text excerpt must be 1000 characters or less.</p>";				
				} else if (intval($rating) > 100 || intval($rating) < 0) {
					$review_error = "<p>Rating must be between 0 and 100..</p>";
				} else {					
					$sql = "UPDATE Review
							SET rating = " . $rating . "
							WHERE reviewID = " . $review_id;
					$result = $conn->query($sql);
					
					$sql = "UPDATE CriticReview
							SET title = \"" . $title . "\",
								textExcerpt = \"" . $textExcerpt . "\"
							WHERE reviewID = " . $review_id;
					$result = $conn->query($sql);
					
					$updated = true;
				}
				unset($_POST['edit']);
			} else if (isset($_POST['delete'])) {				
				$sql = "DELETE FROM Review
						WHERE reviewID = " . $review_id;
				$conn->query($sql);
				
				unset($_POST['delete']);
				header('Location: /critic_management');
			}
		}
		
		$sql = "SELECT R.progID, ES.serialID, ES.name AS showName, 
					ES.seasonID, IF(R.progID IS NULL, NULL, ES.epID) AS epID, 
					P.name AS programName, R.rating, CR.title, CR.textExcerpt
				FROM Review R 
				JOIN CriticReview CR ON R.reviewID = CR.reviewID 
				JOIN Program P ON R.progID = P.progID
				LEFT JOIN (SELECT E.progID, E.serialID, E.seasonID, E.epID, S.name
					FROM Episode E
					LEFT JOIN Serial S
					ON S.serialID = E.serialID) ES
				ON ES.progID = P.progID
				WHERE R.reviewID = " . $review_id . "
				UNION
				SELECT R.progID, ES.serialID, ES.name AS showName, 
					ES.seasonID, NULL, NULL, R.rating, CR.title, CR.textExcerpt
				FROM Review R 
				JOIN CriticReview CR ON R.reviewID = CR.reviewID
				JOIN (SELECT E.progID, E.serialID, E.seasonID, E.epID, S.name
					FROM Episode E
					LEFT JOIN Serial S
					ON S.serialID = E.serialID) ES
				ON ES.seasonID = R.serialID AND ES.seasonID = R.seasonID
				WHERE R.reviewID = " . $review_id;
		$result = $conn->query($sql);
		
		if ($result->num_rows > 0) {
			$row = $result->fetch_assoc();
			
			echo "<form action=\"" . $selfURL . "\" method=\"post\">
					<table class=\"plain\">
						<tr>";
						
			$title = isset($_POST['title']) ? $_POST['title'] : $row['title'];
			$rating = isset($_POST['rating']) ? $_POST['rating'] : $row['rating'];
			$textExcerpt = isset($_POST['textExcerpt']) ? $_POST['textExcerpt'] : $row['textExcerpt'];
			
			if (!empty($row['showName']) && !empty($row['seasonID'])){
				echo "<th>Serial Name</th><td><i>" . $row['showName'] . "</i></td>";
				echo "<th>Season</th><td>" . $row['seasonID'] . "</td>";
				
				if (!empty($row['epID'])) {
					echo "<th>Episode</th><td>" . $row['epID'] . "</td>";
				}
			}
			
			if (!empty($row['epID'])) {
				echo "<th><b>Program Name</b></th><td><input type=\"text\" disabled value=\"" . $row['programName'] . "\"></td></tr>";
			} else {
				echo "</tr>";
			}
			
			echo "<tr>
					<th>Review Title</th><td colspan=\"4\"><input type=\"text\" size=\"50\" name=\"title\" required value=\"" . $title . "\"></td><td>
					<th>Rating</th><td><input type=\"text\" size=\"5\" name=\"rating\" required value=\"" . $rating . "\"> %</td>
				</tr>
				<tr><th>Text Excerpt</th><td colspan=\"4\"><i>Include a summarizing quote from your review.</i></td></tr>
				<tr><td colspan=\"10\"><textarea rows=\"5\" cols=\"85\" name=\"textExcerpt\">" . $textExcerpt . "</textarea></td></tr>
			</table>
			<button type=\"submit\" name=\"edit\">Submit</button>
			<button type=\"submit\" name=\"delete\" class=\"right\">Delete</button>
			</form>";
			  
			if (isset($review_error)) {
				echo $review_error;
			}
			
			echo "<span class=\"content-header\"><h3>Authors</h3></span>
					<table class=\"plain\">";
				
			$innerSql = "SELECT C.reviewerID, C.name
							FROM CriticWrites CW, Critic C
							WHERE CW.reviewerID = C.reviewerID
								AND CW.reviewID = " . $review_id;
			$innerResult = $conn->query($innerSql);
			
			if ($result->num_rows > 0) {
				while ($row = $innerResult->fetch_assoc()) {
					echo "<tr>
							<form action=\"" . $selfURL . "\" method=\"post\">
								<td><input type=\"text\" name=\"authorName\" disabled value=\"" . $row['name'] . "\"></td>
								<td>
									<button class=\"inline\" type=\"submit\" name=\"deleteAuthor\" value=\"" . $row['reviewerID'] . "\">Delete</button>
								</td>
							</form>
						  </tr>";
				}
			}
			
			$newAuthorName = isset($_POST['newAuthorName']) ? $_POST['newAuthorName'] : "";
			
			echo "<tr>
					<form action=\"" . $selfURL . "\" method=\"post\">			
						<td><input type=\"text\" name=\"newAuthorName\" required value=\"" . $newAuthorName . "\"></td>
						<td><button class=\"inline\" type=\"submit\" name=\"addAuthor\">Add</button></td>
					</form>
				  </tr>
			  </table>
			  <p></p>";
			  
			if (isset($pub_error)) {
				echo $pub_error;
			}
			
			echo "</form>
					<span class=\"content-header\"><h3>Publications</h3></span>
						<table class=\"plain\">
							<tr><th>Publication Name</th><th>Publication Date</th></tr>";
				
			$innerSql = "SELECT publicationName, date
							FROM Publishes
							WHERE reviewID = " . $review_id;
			$innerResult = $conn->query($innerSql);
			
			if ($result->num_rows > 0) {
				while ($row = $innerResult->fetch_assoc()) {
					echo "<tr>
							<form action=\"" . $selfURL . "\" method=\"post\">
								<td><input type=\"text\" name=\"pubName\" disabled value=\"" . $row['publicationName'] . "\"></td>
								<td><input type=\"text\" name=\"pubDate\" required value=\"" . $row['date'] . "\"></td>
								<td>
									<button class=\"inline\" type=\"submit\" name=\"updatePub\" value=\"" . $row['publicationName'] . "\">Update</button>
									<button class=\"inline\" type=\"submit\" name=\"deletePub\" value=\"" . $row['publicationName'] . "\">Delete</button>
								</td>
							</form>
						  </tr>";
				}
			}
			
			$newPubName = isset($_POST['newPubName']) ? $_POST['newPubName'] : "";
			$newPubDate = isset($_POST['newPubDate']) ? $_POST['newPubDate'] : "";
			
			echo "<tr>
					<form action=\"" . $selfURL . "\" method=\"post\">			
						<td><input type=\"text\" name=\"newPubName\" required value=\"" . $newPubName . "\"></td>
						<td><input type=\"text\" name=\"newPubDate\" required value=\"" . $newPubDate . "\"></td>
						<td><button class=\"inline\" type=\"submit\" name=\"addPub\">Add</button></td>
					</form>
				  </tr>
			  </table>
			  <p></p>";
			  
			if (isset($pub_error)) {
				echo $pub_error;
			}
			
			echo "</form>";
			
		} else {
			$error = true;
		}
	}
		
	if (isset($updated) && $updated) {
		$updated = false;
		echo "<p>Review updated successfully.</p>";
	}
	
	if ($error) {
		echo "<p>Review information is not available...</p>";
	}
	$conn->close();
} else {
	echo "<span class=\"content-header\"><h3>Access Denied</h3></span>
		  <p>You do not have access to this page. Try logging in, or go <a href=\"http://" . $_SERVER['HTTP_HOST'] . "\">home</a>.</p>";
}	
?>
		</div>
		<div class="column-right">
<?php
$review_id = isset($_GET['id']) ? $_GET['id'] : $_POST['id'];
$selfURL = $_SERVER['PHP_SELF'] . "?id=" . $review_id;

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
	
	echo "<form action=\"" . $selfURL . "\" method=\"post\">
			<input type=\"hidden\" name=\"id\" value=\"" . $review_id . "\">
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
		  <form action=\"" . $selfURL . "\" method=\"post\">
			<input type=\"hidden\" name=\"id\" value=\"" . $review_id . "\">
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
		</div>
	</body>
</html>