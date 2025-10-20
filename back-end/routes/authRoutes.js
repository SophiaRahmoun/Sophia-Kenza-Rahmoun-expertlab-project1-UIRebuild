const express = require("express");
const router = express.Router();
const { register, login } = require("../controllers/authController");
const User = require('../models/User');
const bcrypt = require('bcrypt');
const jwt = require('jsonwebtoken');


router.post("/register", async (req, res) => {
	const { username, password } = req.body;

	if (!username || !password)
		return res.status(400).json({ message: "Missing fields" });

	const existingUser = await User.findOne({ username });
	if (existingUser)
		return res.status(409).json({ message: "User already exists" });

	const hashedPassword = await bcrypt.hash(password, 10);
	const newUser = new User({ username, password: hashedPassword });

	await newUser.save();

	const token = jwt.sign({ userId: newUser._id }, process.env.JWT_SECRET, {
		expiresIn: "7d",
	});

	res.status(201).json({ token, userId: newUser._id });
});

router.post("/login", login);

module.exports = router;

router.get("/", (req, res) => {
	res.send("API Auth workss !");
});
