from robot.libraries.BuiltIn import BuiltIn
import logging
from selenium.common.exceptions import TimeoutException
from robot.api import logger

# Configure basic logging for visibility in Robot log
logging.basicConfig(level=logging.INFO, format='%(levelname)s: %(message)s')


class ParabankLogin:
    """
    Python Library for handling core browser and login interactions for Parabank.
    This library abstracts the low-level SeleniumLibrary keywords.
    """

    # Locators (Encapsulated in the Page Object/Library)
    _USERNAME_FIELD = "name:username"
    _PASSWORD_FIELD = "name:password"
    _LOGIN_BUTTON = "class:button"
    _LOGOUT_LINK = "//a[text()='Log Out']"
    _ACCOUNT_NAME_ASSERTION = "//p[@class='smallText']"  # Welcome message locator

    def __init__(self):
        self.sl = None
        logger.info("ParabankLogin Python Library Initialized.")

    def _get_selenium_library(self):
        """Helper to get the SeleniumLibrary instance dynamically."""
        if self.sl is None:
            try:
                self.sl = BuiltIn().get_library_instance('SeleniumLibrary')
            except Exception as e:
                raise RuntimeError(
                    f"Failed to get SeleniumLibrary instance: {e}. Ensure it is imported in the .robot file.")
        return self.sl

    def navigate_to_home_page(self, url, browser):
        """
        Opens the browser and navigates to the specified URL.
        """
        sl = self._get_selenium_library()
        logger.info(f"Opening {browser} to {url}")
        sl.open_browser(url, browser)
        sl.maximize_browser_window()

    def perform_login(self, username, password):
        """
        Enters credentials and clicks the login button.
        """
        sl = self._get_selenium_library()
        logger.info(f"Attempting login for user: {username}")

        # Add basic resilience via waits (Good practice!)
        sl.wait_until_element_is_visible(self._USERNAME_FIELD, timeout=5)

        sl.input_text(self._USERNAME_FIELD, username)
        sl.input_text(self._PASSWORD_FIELD, password)
        sl.click_button(self._LOGIN_BUTTON)

    def verify_user_logged_in(self, first_name, last_name):
        """
        Checks for the expected welcome message after login.
        """
        sl = self._get_selenium_library()
        expected_text = f"Welcome {first_name} {last_name}"
        logger.info(f"Verifying successful login. Expected text: '{expected_text}'")

        try:
            sl.wait_until_element_is_visible(self._ACCOUNT_NAME_ASSERTION, timeout=5)
            sl.element_text_should_be(self._ACCOUNT_NAME_ASSERTION, expected_text)
        except TimeoutException:
            raise AssertionError(f"Login failed: Could not find expected welcome message: '{expected_text}'")

    def log_out_from_account(self):
        """
        Clicks the LogOut link.
        """
        sl = self._get_selenium_library()
        logger.info("Logging out of user account.")
        sl.wait_until_element_is_visible(self._LOGOUT_LINK, timeout=5)
        sl.click_link(self._LOGOUT_LINK)