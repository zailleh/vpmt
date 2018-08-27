<template>
  <nav id="navbar">
    <ul>
      <li>
        <span>Appointments</span>
      <ul class="submenu">
          <li><a href="/appointments">All</a></li>
          <li><a href="/appointments/new">All</a></li>
          <li>Find</li>
        </ul>
      </li>
      <li>
        <span>Patients</span>
        <ul class="submenu">
          <li><a href="/patients">All</a></li>
          <li><a href="/patients/new">New</a></li>
          <li>Find</li>
        </ul>
      </li>
      <li>
        <span>Customers</span>
      <ul class="submenu">
          <li><a href="/customers">All</a></li>
          <li><a href="/customers/new">New</a></li>
          <li>Find</li>
        </ul>
      </li>
      <li>
        <span>Admissions</span>
      <ul class="submenu">
          <li><a href="/admissions">All</a></li>
          <li><a href="/admissins/new">New</a></li>
          <li>Find</li>
        </ul>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
}
</script>