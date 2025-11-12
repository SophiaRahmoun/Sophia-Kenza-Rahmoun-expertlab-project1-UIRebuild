const User = require("../models/User");
const bcrypt = require("bcryptjs");
const jwt = require("jsonwebtoken");

exports.register = async (req, res) => {
	try {
		const { username, password } = req.body;

		const existing = await User.findOne({ username });
		if (existing)
			return res.status(400).json({ msg: "Username already exists" });

		const hashed = await bcrypt.hash(password, 10);
		const newUser = new User({ username, password: hashed });
		await newUser.save();

		res.status(201).json({ msg: "User created" });
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};

exports.login = async (req, res) => {
	try {
		const { username, password } = req.body;
		const user = await User.findOne({ username });
		if (!user) return res.status(400).json({ msg: "User not found" });

		const isMatch = await bcrypt.compare(password, user.password);
		if (!isMatch) return res.status(400).json({ msg: "Invalid credentials" });

		const token = jwt.sign({ id: user._id }, process.env.JWT_SECRET);
		res.json({
			id: user._id.toString(),
			username: user.username,
			email: user.email ?? "",
			token,
		});
	} catch (err) {
		res.status(500).json({ error: err.message });
	}
};
