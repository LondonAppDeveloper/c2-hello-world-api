from django.test import TestCase


class HelloWorldTestCase(TestCase):

    def test_one_is_one(self):
        self.assertEqual(1, 2)
